%% coding: latin-1
%%: 实现
-module(cfg_equipment_randomprop_chs).
-compile(export_all).
-include("cfg_equipment_randomprop.hrl").
-include("logger.hrl").

getRow(403,135)->
    #equipment_randompropCfg {
    id = 403,
    propid = 135,
    probability = 80,
    min = 0,
    max = 4320,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,136)->
    #equipment_randompropCfg {
    id = 403,
    propid = 136,
    probability = 90,
    min = 0,
    max = 380,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,138)->
    #equipment_randompropCfg {
    id = 403,
    propid = 138,
    probability = 50,
    min = 0,
    max = 620,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,139)->
    #equipment_randompropCfg {
    id = 403,
    propid = 139,
    probability = 50,
    min = 0,
    max = 620,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,140)->
    #equipment_randompropCfg {
    id = 403,
    propid = 140,
    probability = 50,
    min = 0,
    max = 480,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,141)->
    #equipment_randompropCfg {
    id = 403,
    propid = 141,
    probability = 50,
    min = 0,
    max = 480,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,142)->
    #equipment_randompropCfg {
    id = 403,
    propid = 142,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,143)->
    #equipment_randompropCfg {
    id = 403,
    propid = 143,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,144)->
    #equipment_randompropCfg {
    id = 403,
    propid = 144,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,145)->
    #equipment_randompropCfg {
    id = 403,
    propid = 145,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,146)->
    #equipment_randompropCfg {
    id = 403,
    propid = 146,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(403,160)->
    #equipment_randompropCfg {
    id = 403,
    propid = 160,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,135)->
    #equipment_randompropCfg {
    id = 405,
    propid = 135,
    probability = 80,
    min = 0,
    max = 4320,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,137)->
    #equipment_randompropCfg {
    id = 405,
    propid = 137,
    probability = 90,
    min = 0,
    max = 380,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,138)->
    #equipment_randompropCfg {
    id = 405,
    propid = 138,
    probability = 50,
    min = 0,
    max = 620,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,139)->
    #equipment_randompropCfg {
    id = 405,
    propid = 139,
    probability = 50,
    min = 0,
    max = 620,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,140)->
    #equipment_randompropCfg {
    id = 405,
    propid = 140,
    probability = 50,
    min = 0,
    max = 480,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,141)->
    #equipment_randompropCfg {
    id = 405,
    propid = 141,
    probability = 50,
    min = 0,
    max = 480,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,142)->
    #equipment_randompropCfg {
    id = 405,
    propid = 142,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,143)->
    #equipment_randompropCfg {
    id = 405,
    propid = 143,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,144)->
    #equipment_randompropCfg {
    id = 405,
    propid = 144,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,145)->
    #equipment_randompropCfg {
    id = 405,
    propid = 145,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,146)->
    #equipment_randompropCfg {
    id = 405,
    propid = 146,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(405,160)->
    #equipment_randompropCfg {
    id = 405,
    propid = 160,
    probability = 50,
    min = 0,
    max = 580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,135)->
    #equipment_randompropCfg {
    id = 604,
    propid = 135,
    probability = 80,
    min = 0,
    max = 7610,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,136)->
    #equipment_randompropCfg {
    id = 604,
    propid = 136,
    probability = 90,
    min = 0,
    max = 680,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,138)->
    #equipment_randompropCfg {
    id = 604,
    propid = 138,
    probability = 50,
    min = 0,
    max = 1100,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,139)->
    #equipment_randompropCfg {
    id = 604,
    propid = 139,
    probability = 50,
    min = 0,
    max = 1100,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,140)->
    #equipment_randompropCfg {
    id = 604,
    propid = 140,
    probability = 50,
    min = 0,
    max = 850,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,141)->
    #equipment_randompropCfg {
    id = 604,
    propid = 141,
    probability = 50,
    min = 0,
    max = 850,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,142)->
    #equipment_randompropCfg {
    id = 604,
    propid = 142,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,143)->
    #equipment_randompropCfg {
    id = 604,
    propid = 143,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,144)->
    #equipment_randompropCfg {
    id = 604,
    propid = 144,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,145)->
    #equipment_randompropCfg {
    id = 604,
    propid = 145,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,146)->
    #equipment_randompropCfg {
    id = 604,
    propid = 146,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(604,160)->
    #equipment_randompropCfg {
    id = 604,
    propid = 160,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,135)->
    #equipment_randompropCfg {
    id = 606,
    propid = 135,
    probability = 80,
    min = 0,
    max = 7610,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,137)->
    #equipment_randompropCfg {
    id = 606,
    propid = 137,
    probability = 90,
    min = 0,
    max = 680,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,138)->
    #equipment_randompropCfg {
    id = 606,
    propid = 138,
    probability = 50,
    min = 0,
    max = 1100,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,139)->
    #equipment_randompropCfg {
    id = 606,
    propid = 139,
    probability = 50,
    min = 0,
    max = 1100,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,140)->
    #equipment_randompropCfg {
    id = 606,
    propid = 140,
    probability = 50,
    min = 0,
    max = 850,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,141)->
    #equipment_randompropCfg {
    id = 606,
    propid = 141,
    probability = 50,
    min = 0,
    max = 850,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,142)->
    #equipment_randompropCfg {
    id = 606,
    propid = 142,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,143)->
    #equipment_randompropCfg {
    id = 606,
    propid = 143,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,144)->
    #equipment_randompropCfg {
    id = 606,
    propid = 144,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,145)->
    #equipment_randompropCfg {
    id = 606,
    propid = 145,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,146)->
    #equipment_randompropCfg {
    id = 606,
    propid = 146,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(606,160)->
    #equipment_randompropCfg {
    id = 606,
    propid = 160,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,135)->
    #equipment_randompropCfg {
    id = 652,
    propid = 135,
    probability = 80,
    min = 0,
    max = 3270,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,136)->
    #equipment_randompropCfg {
    id = 652,
    propid = 136,
    probability = 90,
    min = 0,
    max = 290,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,138)->
    #equipment_randompropCfg {
    id = 652,
    propid = 138,
    probability = 50,
    min = 0,
    max = 470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,139)->
    #equipment_randompropCfg {
    id = 652,
    propid = 139,
    probability = 50,
    min = 0,
    max = 470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,140)->
    #equipment_randompropCfg {
    id = 652,
    propid = 140,
    probability = 50,
    min = 0,
    max = 360,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,141)->
    #equipment_randompropCfg {
    id = 652,
    propid = 141,
    probability = 50,
    min = 0,
    max = 360,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,142)->
    #equipment_randompropCfg {
    id = 652,
    propid = 142,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,143)->
    #equipment_randompropCfg {
    id = 652,
    propid = 143,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,144)->
    #equipment_randompropCfg {
    id = 652,
    propid = 144,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,145)->
    #equipment_randompropCfg {
    id = 652,
    propid = 145,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,146)->
    #equipment_randompropCfg {
    id = 652,
    propid = 146,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(652,160)->
    #equipment_randompropCfg {
    id = 652,
    propid = 160,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,135)->
    #equipment_randompropCfg {
    id = 653,
    propid = 135,
    probability = 80,
    min = 0,
    max = 8710,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,136)->
    #equipment_randompropCfg {
    id = 653,
    propid = 136,
    probability = 90,
    min = 0,
    max = 770,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,138)->
    #equipment_randompropCfg {
    id = 653,
    propid = 138,
    probability = 50,
    min = 0,
    max = 1260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,139)->
    #equipment_randompropCfg {
    id = 653,
    propid = 139,
    probability = 50,
    min = 0,
    max = 1260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,140)->
    #equipment_randompropCfg {
    id = 653,
    propid = 140,
    probability = 50,
    min = 0,
    max = 970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,141)->
    #equipment_randompropCfg {
    id = 653,
    propid = 141,
    probability = 50,
    min = 0,
    max = 970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,142)->
    #equipment_randompropCfg {
    id = 653,
    propid = 142,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,143)->
    #equipment_randompropCfg {
    id = 653,
    propid = 143,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,144)->
    #equipment_randompropCfg {
    id = 653,
    propid = 144,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,145)->
    #equipment_randompropCfg {
    id = 653,
    propid = 145,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,146)->
    #equipment_randompropCfg {
    id = 653,
    propid = 146,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(653,160)->
    #equipment_randompropCfg {
    id = 653,
    propid = 160,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,135)->
    #equipment_randompropCfg {
    id = 655,
    propid = 135,
    probability = 80,
    min = 0,
    max = 8710,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,137)->
    #equipment_randompropCfg {
    id = 655,
    propid = 137,
    probability = 90,
    min = 0,
    max = 770,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,138)->
    #equipment_randompropCfg {
    id = 655,
    propid = 138,
    probability = 50,
    min = 0,
    max = 1260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,139)->
    #equipment_randompropCfg {
    id = 655,
    propid = 139,
    probability = 50,
    min = 0,
    max = 1260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,140)->
    #equipment_randompropCfg {
    id = 655,
    propid = 140,
    probability = 50,
    min = 0,
    max = 970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,141)->
    #equipment_randompropCfg {
    id = 655,
    propid = 141,
    probability = 50,
    min = 0,
    max = 970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,142)->
    #equipment_randompropCfg {
    id = 655,
    propid = 142,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,143)->
    #equipment_randompropCfg {
    id = 655,
    propid = 143,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,144)->
    #equipment_randompropCfg {
    id = 655,
    propid = 144,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,145)->
    #equipment_randompropCfg {
    id = 655,
    propid = 145,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,146)->
    #equipment_randompropCfg {
    id = 655,
    propid = 146,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(655,160)->
    #equipment_randompropCfg {
    id = 655,
    propid = 160,
    probability = 50,
    min = 0,
    max = 1160,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,135)->
    #equipment_randompropCfg {
    id = 657,
    propid = 135,
    probability = 80,
    min = 0,
    max = 3270,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,137)->
    #equipment_randompropCfg {
    id = 657,
    propid = 137,
    probability = 90,
    min = 0,
    max = 290,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,138)->
    #equipment_randompropCfg {
    id = 657,
    propid = 138,
    probability = 50,
    min = 0,
    max = 470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,139)->
    #equipment_randompropCfg {
    id = 657,
    propid = 139,
    probability = 50,
    min = 0,
    max = 470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,140)->
    #equipment_randompropCfg {
    id = 657,
    propid = 140,
    probability = 50,
    min = 0,
    max = 360,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,141)->
    #equipment_randompropCfg {
    id = 657,
    propid = 141,
    probability = 50,
    min = 0,
    max = 360,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,142)->
    #equipment_randompropCfg {
    id = 657,
    propid = 142,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,143)->
    #equipment_randompropCfg {
    id = 657,
    propid = 143,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,144)->
    #equipment_randompropCfg {
    id = 657,
    propid = 144,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,145)->
    #equipment_randompropCfg {
    id = 657,
    propid = 145,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,146)->
    #equipment_randompropCfg {
    id = 657,
    propid = 146,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(657,160)->
    #equipment_randompropCfg {
    id = 657,
    propid = 160,
    probability = 50,
    min = 0,
    max = 440,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,135)->
    #equipment_randompropCfg {
    id = 902,
    propid = 135,
    probability = 80,
    min = 0,
    max = 6010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,136)->
    #equipment_randompropCfg {
    id = 902,
    propid = 136,
    probability = 90,
    min = 0,
    max = 530,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,138)->
    #equipment_randompropCfg {
    id = 902,
    propid = 138,
    probability = 50,
    min = 0,
    max = 870,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,139)->
    #equipment_randompropCfg {
    id = 902,
    propid = 139,
    probability = 50,
    min = 0,
    max = 870,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,140)->
    #equipment_randompropCfg {
    id = 902,
    propid = 140,
    probability = 50,
    min = 0,
    max = 670,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,141)->
    #equipment_randompropCfg {
    id = 902,
    propid = 141,
    probability = 50,
    min = 0,
    max = 670,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,142)->
    #equipment_randompropCfg {
    id = 902,
    propid = 142,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,143)->
    #equipment_randompropCfg {
    id = 902,
    propid = 143,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,144)->
    #equipment_randompropCfg {
    id = 902,
    propid = 144,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,145)->
    #equipment_randompropCfg {
    id = 902,
    propid = 145,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,146)->
    #equipment_randompropCfg {
    id = 902,
    propid = 146,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(902,160)->
    #equipment_randompropCfg {
    id = 902,
    propid = 160,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,135)->
    #equipment_randompropCfg {
    id = 903,
    propid = 135,
    probability = 80,
    min = 0,
    max = 16000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,136)->
    #equipment_randompropCfg {
    id = 903,
    propid = 136,
    probability = 90,
    min = 0,
    max = 1430,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,138)->
    #equipment_randompropCfg {
    id = 903,
    propid = 138,
    probability = 50,
    min = 0,
    max = 2320,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,139)->
    #equipment_randompropCfg {
    id = 903,
    propid = 139,
    probability = 50,
    min = 0,
    max = 2320,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,140)->
    #equipment_randompropCfg {
    id = 903,
    propid = 140,
    probability = 50,
    min = 0,
    max = 1780,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,141)->
    #equipment_randompropCfg {
    id = 903,
    propid = 141,
    probability = 50,
    min = 0,
    max = 1780,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,142)->
    #equipment_randompropCfg {
    id = 903,
    propid = 142,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,143)->
    #equipment_randompropCfg {
    id = 903,
    propid = 143,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,144)->
    #equipment_randompropCfg {
    id = 903,
    propid = 144,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,145)->
    #equipment_randompropCfg {
    id = 903,
    propid = 145,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,146)->
    #equipment_randompropCfg {
    id = 903,
    propid = 146,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(903,160)->
    #equipment_randompropCfg {
    id = 903,
    propid = 160,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,135)->
    #equipment_randompropCfg {
    id = 905,
    propid = 135,
    probability = 80,
    min = 0,
    max = 16000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,137)->
    #equipment_randompropCfg {
    id = 905,
    propid = 137,
    probability = 90,
    min = 0,
    max = 1430,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,138)->
    #equipment_randompropCfg {
    id = 905,
    propid = 138,
    probability = 50,
    min = 0,
    max = 2320,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,139)->
    #equipment_randompropCfg {
    id = 905,
    propid = 139,
    probability = 50,
    min = 0,
    max = 2320,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,140)->
    #equipment_randompropCfg {
    id = 905,
    propid = 140,
    probability = 50,
    min = 0,
    max = 1780,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,141)->
    #equipment_randompropCfg {
    id = 905,
    propid = 141,
    probability = 50,
    min = 0,
    max = 1780,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,142)->
    #equipment_randompropCfg {
    id = 905,
    propid = 142,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,143)->
    #equipment_randompropCfg {
    id = 905,
    propid = 143,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,144)->
    #equipment_randompropCfg {
    id = 905,
    propid = 144,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,145)->
    #equipment_randompropCfg {
    id = 905,
    propid = 145,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,146)->
    #equipment_randompropCfg {
    id = 905,
    propid = 146,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(905,160)->
    #equipment_randompropCfg {
    id = 905,
    propid = 160,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,135)->
    #equipment_randompropCfg {
    id = 907,
    propid = 135,
    probability = 80,
    min = 0,
    max = 6010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,137)->
    #equipment_randompropCfg {
    id = 907,
    propid = 137,
    probability = 90,
    min = 0,
    max = 530,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,138)->
    #equipment_randompropCfg {
    id = 907,
    propid = 138,
    probability = 50,
    min = 0,
    max = 870,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,139)->
    #equipment_randompropCfg {
    id = 907,
    propid = 139,
    probability = 50,
    min = 0,
    max = 870,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,140)->
    #equipment_randompropCfg {
    id = 907,
    propid = 140,
    probability = 50,
    min = 0,
    max = 670,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,141)->
    #equipment_randompropCfg {
    id = 907,
    propid = 141,
    probability = 50,
    min = 0,
    max = 670,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,142)->
    #equipment_randompropCfg {
    id = 907,
    propid = 142,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,143)->
    #equipment_randompropCfg {
    id = 907,
    propid = 143,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,144)->
    #equipment_randompropCfg {
    id = 907,
    propid = 144,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,145)->
    #equipment_randompropCfg {
    id = 907,
    propid = 145,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,146)->
    #equipment_randompropCfg {
    id = 907,
    propid = 146,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(907,160)->
    #equipment_randompropCfg {
    id = 907,
    propid = 160,
    probability = 50,
    min = 0,
    max = 800,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,135)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 135,
    probability = 80,
    min = 0,
    max = 9090,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,136)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 136,
    probability = 90,
    min = 0,
    max = 810,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,138)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 138,
    probability = 50,
    min = 0,
    max = 1310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,139)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 139,
    probability = 50,
    min = 0,
    max = 1310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,140)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 140,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,141)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 141,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,142)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 142,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,143)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 143,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,144)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 144,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,145)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 145,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,146)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 146,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1102,160)->
    #equipment_randompropCfg {
    id = 1102,
    propid = 160,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,135)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 135,
    probability = 80,
    min = 0,
    max = 24000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,136)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 136,
    probability = 90,
    min = 0,
    max = 2150,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,138)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 138,
    probability = 50,
    min = 0,
    max = 3500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,139)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 139,
    probability = 50,
    min = 0,
    max = 3500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,140)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 140,
    probability = 50,
    min = 0,
    max = 2690,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,141)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 141,
    probability = 50,
    min = 0,
    max = 2690,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,142)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 142,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,143)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 143,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,144)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 144,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,145)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 145,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,146)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 146,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1103,160)->
    #equipment_randompropCfg {
    id = 1103,
    propid = 160,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,135)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 135,
    probability = 80,
    min = 0,
    max = 24000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,137)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 137,
    probability = 90,
    min = 0,
    max = 2150,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,138)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 138,
    probability = 50,
    min = 0,
    max = 3500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,139)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 139,
    probability = 50,
    min = 0,
    max = 3500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,140)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 140,
    probability = 50,
    min = 0,
    max = 2690,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,141)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 141,
    probability = 50,
    min = 0,
    max = 2690,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,142)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 142,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,143)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 143,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,144)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 144,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,145)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 145,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,146)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 146,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1105,160)->
    #equipment_randompropCfg {
    id = 1105,
    propid = 160,
    probability = 50,
    min = 0,
    max = 3230,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,135)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 135,
    probability = 80,
    min = 0,
    max = 9090,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,137)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 137,
    probability = 90,
    min = 0,
    max = 810,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,138)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 138,
    probability = 50,
    min = 0,
    max = 1310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,139)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 139,
    probability = 50,
    min = 0,
    max = 1310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,140)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 140,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,141)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 141,
    probability = 50,
    min = 0,
    max = 1010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,142)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 142,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,143)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 143,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,144)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 144,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,145)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 145,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,146)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 146,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1107,160)->
    #equipment_randompropCfg {
    id = 1107,
    propid = 160,
    probability = 50,
    min = 0,
    max = 1210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,135)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 135,
    probability = 80,
    min = 0,
    max = 29000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,136)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 136,
    probability = 90,
    min = 0,
    max = 2590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,138)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 138,
    probability = 50,
    min = 0,
    max = 4210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,139)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 139,
    probability = 50,
    min = 0,
    max = 4210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,140)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 140,
    probability = 50,
    min = 0,
    max = 3240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,141)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 141,
    probability = 50,
    min = 0,
    max = 3240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,142)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 142,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,143)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 143,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,144)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 144,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,145)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 145,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,146)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 146,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1204,160)->
    #equipment_randompropCfg {
    id = 1204,
    propid = 160,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,135)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 135,
    probability = 80,
    min = 0,
    max = 29000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,137)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 137,
    probability = 90,
    min = 0,
    max = 2590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,138)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 138,
    probability = 50,
    min = 0,
    max = 4210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,139)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 139,
    probability = 50,
    min = 0,
    max = 4210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,140)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 140,
    probability = 50,
    min = 0,
    max = 3240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,141)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 141,
    probability = 50,
    min = 0,
    max = 3240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,142)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 142,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,143)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 143,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,144)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 144,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,145)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 145,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,146)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 146,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1206,160)->
    #equipment_randompropCfg {
    id = 1206,
    propid = 160,
    probability = 50,
    min = 0,
    max = 3890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,135)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 135,
    probability = 80,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,136)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 136,
    probability = 90,
    min = 0,
    max = 1060,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,138)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 138,
    probability = 50,
    min = 0,
    max = 1720,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,139)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 139,
    probability = 50,
    min = 0,
    max = 1720,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,140)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 140,
    probability = 50,
    min = 0,
    max = 1330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,141)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 141,
    probability = 50,
    min = 0,
    max = 1330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,142)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 142,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,143)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 143,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,144)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 144,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,145)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 145,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,146)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 146,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1252,160)->
    #equipment_randompropCfg {
    id = 1252,
    propid = 160,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,135)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 135,
    probability = 80,
    min = 0,
    max = 32000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,136)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 136,
    probability = 90,
    min = 0,
    max = 2830,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,138)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 138,
    probability = 50,
    min = 0,
    max = 4600,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,139)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 139,
    probability = 50,
    min = 0,
    max = 4600,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,140)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 140,
    probability = 50,
    min = 0,
    max = 3530,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,141)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 141,
    probability = 50,
    min = 0,
    max = 3530,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,142)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 142,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,143)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 143,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,144)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 144,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,145)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 145,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,146)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 146,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1253,160)->
    #equipment_randompropCfg {
    id = 1253,
    propid = 160,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,135)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 135,
    probability = 80,
    min = 0,
    max = 32000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,137)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 137,
    probability = 90,
    min = 0,
    max = 2830,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,138)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 138,
    probability = 50,
    min = 0,
    max = 4600,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,139)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 139,
    probability = 50,
    min = 0,
    max = 4600,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,140)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 140,
    probability = 50,
    min = 0,
    max = 3530,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,141)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 141,
    probability = 50,
    min = 0,
    max = 3530,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,142)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 142,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,143)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 143,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,144)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 144,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,145)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 145,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,146)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 146,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1255,160)->
    #equipment_randompropCfg {
    id = 1255,
    propid = 160,
    probability = 50,
    min = 0,
    max = 4240,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,135)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 135,
    probability = 80,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,137)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 137,
    probability = 90,
    min = 0,
    max = 1060,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,138)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 138,
    probability = 50,
    min = 0,
    max = 1720,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,139)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 139,
    probability = 50,
    min = 0,
    max = 1720,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,140)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 140,
    probability = 50,
    min = 0,
    max = 1330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,141)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 141,
    probability = 50,
    min = 0,
    max = 1330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,142)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 142,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,143)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 143,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,144)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 144,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,145)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 145,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,146)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 146,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1257,160)->
    #equipment_randompropCfg {
    id = 1257,
    propid = 160,
    probability = 50,
    min = 0,
    max = 1590,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,135)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 135,
    probability = 80,
    min = 0,
    max = 15000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,136)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 136,
    probability = 90,
    min = 0,
    max = 1320,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,138)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 138,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,139)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 139,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,140)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 140,
    probability = 50,
    min = 0,
    max = 1640,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,141)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 141,
    probability = 50,
    min = 0,
    max = 1640,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,142)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 142,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,143)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 143,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,144)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 144,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,145)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 145,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,146)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 146,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1402,160)->
    #equipment_randompropCfg {
    id = 1402,
    propid = 160,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,135)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 135,
    probability = 80,
    min = 0,
    max = 39000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,136)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 136,
    probability = 90,
    min = 0,
    max = 3510,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,138)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 138,
    probability = 50,
    min = 0,
    max = 5700,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,139)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 139,
    probability = 50,
    min = 0,
    max = 5700,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,140)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 140,
    probability = 50,
    min = 0,
    max = 4390,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,141)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 141,
    probability = 50,
    min = 0,
    max = 4390,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,142)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 142,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,143)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 143,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,144)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 144,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,145)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 145,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,146)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 146,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1403,160)->
    #equipment_randompropCfg {
    id = 1403,
    propid = 160,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,135)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 135,
    probability = 80,
    min = 0,
    max = 39000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,137)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 137,
    probability = 90,
    min = 0,
    max = 3510,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,138)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 138,
    probability = 50,
    min = 0,
    max = 5700,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,139)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 139,
    probability = 50,
    min = 0,
    max = 5700,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,140)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 140,
    probability = 50,
    min = 0,
    max = 4390,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,141)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 141,
    probability = 50,
    min = 0,
    max = 4390,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,142)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 142,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,143)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 143,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,144)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 144,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,145)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 145,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,146)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 146,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1405,160)->
    #equipment_randompropCfg {
    id = 1405,
    propid = 160,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,135)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 135,
    probability = 80,
    min = 0,
    max = 15000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,137)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 137,
    probability = 90,
    min = 0,
    max = 1320,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,138)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 138,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,139)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 139,
    probability = 50,
    min = 0,
    max = 2140,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,140)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 140,
    probability = 50,
    min = 0,
    max = 1640,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,141)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 141,
    probability = 50,
    min = 0,
    max = 1640,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,142)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 142,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,143)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 143,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,144)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 144,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,145)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 145,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,146)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 146,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1407,160)->
    #equipment_randompropCfg {
    id = 1407,
    propid = 160,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,135)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 135,
    probability = 80,
    min = 0,
    max = 18000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,136)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 136,
    probability = 90,
    min = 0,
    max = 1580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,138)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 138,
    probability = 50,
    min = 0,
    max = 2560,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,139)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 139,
    probability = 50,
    min = 0,
    max = 2560,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,140)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 140,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,141)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 141,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,142)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 142,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,143)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 143,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,144)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 144,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,145)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 145,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,146)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 146,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1502,160)->
    #equipment_randompropCfg {
    id = 1502,
    propid = 160,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,135)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 135,
    probability = 80,
    min = 0,
    max = 47000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,136)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 136,
    probability = 90,
    min = 0,
    max = 4210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,138)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 138,
    probability = 50,
    min = 0,
    max = 6840,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,139)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 139,
    probability = 50,
    min = 0,
    max = 6840,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,140)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 140,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,141)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 141,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,142)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 142,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,143)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 143,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,144)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 144,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,145)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 145,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,146)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 146,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1503,160)->
    #equipment_randompropCfg {
    id = 1503,
    propid = 160,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,135)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 135,
    probability = 80,
    min = 0,
    max = 47000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,136)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 136,
    probability = 90,
    min = 0,
    max = 4210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,138)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 138,
    probability = 50,
    min = 0,
    max = 6840,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,139)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 139,
    probability = 50,
    min = 0,
    max = 6840,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,140)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 140,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,141)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 141,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,142)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 142,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,143)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 143,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,144)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 144,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,145)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 145,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,146)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 146,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1504,160)->
    #equipment_randompropCfg {
    id = 1504,
    propid = 160,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,135)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 135,
    probability = 80,
    min = 0,
    max = 47000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,137)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 137,
    probability = 90,
    min = 0,
    max = 4210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,138)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 138,
    probability = 50,
    min = 0,
    max = 6840,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,139)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 139,
    probability = 50,
    min = 0,
    max = 6840,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,140)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 140,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,141)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 141,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,142)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 142,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,143)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 143,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,144)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 144,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,145)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 145,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,146)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 146,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1505,160)->
    #equipment_randompropCfg {
    id = 1505,
    propid = 160,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,135)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 135,
    probability = 80,
    min = 0,
    max = 47000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,137)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 137,
    probability = 90,
    min = 0,
    max = 4210,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,138)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 138,
    probability = 50,
    min = 0,
    max = 6840,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,139)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 139,
    probability = 50,
    min = 0,
    max = 6840,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,140)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 140,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,141)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 141,
    probability = 50,
    min = 0,
    max = 5260,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,142)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 142,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,143)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 143,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,144)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 144,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,145)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 145,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,146)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 146,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1506,160)->
    #equipment_randompropCfg {
    id = 1506,
    propid = 160,
    probability = 50,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,135)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 135,
    probability = 80,
    min = 0,
    max = 18000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,137)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 137,
    probability = 90,
    min = 0,
    max = 1580,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,138)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 138,
    probability = 50,
    min = 0,
    max = 2560,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,139)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 139,
    probability = 50,
    min = 0,
    max = 2560,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,140)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 140,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,141)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 141,
    probability = 50,
    min = 0,
    max = 1970,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,142)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 142,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,143)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 143,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,144)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 144,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,145)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 145,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,146)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 146,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1507,160)->
    #equipment_randompropCfg {
    id = 1507,
    propid = 160,
    probability = 50,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,135)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 135,
    probability = 80,
    min = 0,
    max = 20000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,136)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 136,
    probability = 90,
    min = 0,
    max = 1820,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,138)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 138,
    probability = 50,
    min = 0,
    max = 2960,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,139)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 139,
    probability = 50,
    min = 0,
    max = 2960,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,140)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 140,
    probability = 50,
    min = 0,
    max = 2280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,141)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 141,
    probability = 50,
    min = 0,
    max = 2280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,142)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 142,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,143)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 143,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,144)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 144,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,145)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 145,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,146)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 146,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1602,160)->
    #equipment_randompropCfg {
    id = 1602,
    propid = 160,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,135)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 135,
    probability = 80,
    min = 0,
    max = 55000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,136)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 136,
    probability = 90,
    min = 0,
    max = 4860,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,138)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 138,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,139)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 139,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,140)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 140,
    probability = 50,
    min = 0,
    max = 6070,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,141)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 141,
    probability = 50,
    min = 0,
    max = 6070,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,142)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 142,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,143)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 143,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,144)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 144,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,145)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 145,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,146)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 146,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1603,160)->
    #equipment_randompropCfg {
    id = 1603,
    propid = 160,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,135)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 135,
    probability = 80,
    min = 0,
    max = 55000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,137)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 137,
    probability = 90,
    min = 0,
    max = 4860,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,138)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 138,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,139)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 139,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,140)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 140,
    probability = 50,
    min = 0,
    max = 6070,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,141)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 141,
    probability = 50,
    min = 0,
    max = 6070,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,142)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 142,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,143)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 143,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,144)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 144,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,145)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 145,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,146)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 146,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1605,160)->
    #equipment_randompropCfg {
    id = 1605,
    propid = 160,
    probability = 50,
    min = 0,
    max = 7280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,135)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 135,
    probability = 80,
    min = 0,
    max = 20000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,137)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 137,
    probability = 90,
    min = 0,
    max = 1820,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,138)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 138,
    probability = 50,
    min = 0,
    max = 2960,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,139)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 139,
    probability = 50,
    min = 0,
    max = 2960,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,140)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 140,
    probability = 50,
    min = 0,
    max = 2280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,141)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 141,
    probability = 50,
    min = 0,
    max = 2280,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,142)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 142,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,143)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 143,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,144)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 144,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,145)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 145,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,146)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 146,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1607,160)->
    #equipment_randompropCfg {
    id = 1607,
    propid = 160,
    probability = 50,
    min = 0,
    max = 2730,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,135)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 135,
    probability = 80,
    min = 0,
    max = 23000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,136)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 136,
    probability = 90,
    min = 0,
    max = 2080,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,138)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 138,
    probability = 50,
    min = 0,
    max = 3390,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,139)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 139,
    probability = 50,
    min = 0,
    max = 3390,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,140)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 140,
    probability = 50,
    min = 0,
    max = 2600,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,141)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 141,
    probability = 50,
    min = 0,
    max = 2600,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,142)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 142,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,143)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 143,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,144)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 144,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,145)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 145,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,146)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 146,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1702,160)->
    #equipment_randompropCfg {
    id = 1702,
    propid = 160,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,135)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 135,
    probability = 80,
    min = 0,
    max = 63000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,136)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 136,
    probability = 90,
    min = 0,
    max = 5560,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,138)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 138,
    probability = 50,
    min = 0,
    max = 9030,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,139)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 139,
    probability = 50,
    min = 0,
    max = 9030,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,140)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 140,
    probability = 50,
    min = 0,
    max = 6950,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,141)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 141,
    probability = 50,
    min = 0,
    max = 6950,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,142)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 142,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,143)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 143,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,144)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 144,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,145)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 145,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,146)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 146,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1703,160)->
    #equipment_randompropCfg {
    id = 1703,
    propid = 160,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,135)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 135,
    probability = 80,
    min = 0,
    max = 63000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,137)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 137,
    probability = 90,
    min = 0,
    max = 5560,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,138)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 138,
    probability = 50,
    min = 0,
    max = 9030,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,139)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 139,
    probability = 50,
    min = 0,
    max = 9030,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,140)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 140,
    probability = 50,
    min = 0,
    max = 6950,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,141)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 141,
    probability = 50,
    min = 0,
    max = 6950,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,142)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 142,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,143)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 143,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,144)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 144,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,145)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 145,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,146)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 146,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1705,160)->
    #equipment_randompropCfg {
    id = 1705,
    propid = 160,
    probability = 50,
    min = 0,
    max = 8330,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,135)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 135,
    probability = 80,
    min = 0,
    max = 23000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,137)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 137,
    probability = 90,
    min = 0,
    max = 2080,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,138)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 138,
    probability = 50,
    min = 0,
    max = 3390,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,139)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 139,
    probability = 50,
    min = 0,
    max = 3390,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,140)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 140,
    probability = 50,
    min = 0,
    max = 2600,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,141)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 141,
    probability = 50,
    min = 0,
    max = 2600,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,142)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 142,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,143)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 143,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,144)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 144,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,145)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 145,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,146)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 146,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1707,160)->
    #equipment_randompropCfg {
    id = 1707,
    propid = 160,
    probability = 50,
    min = 0,
    max = 3130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,135)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 135,
    probability = 80,
    min = 0,
    max = 27000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,136)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 136,
    probability = 90,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,138)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 138,
    probability = 50,
    min = 0,
    max = 3850,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,139)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 139,
    probability = 50,
    min = 0,
    max = 3850,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,140)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 140,
    probability = 50,
    min = 0,
    max = 2960,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,141)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 141,
    probability = 50,
    min = 0,
    max = 2960,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,142)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 142,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,143)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 143,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,144)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 144,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,145)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 145,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,146)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 146,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1802,160)->
    #equipment_randompropCfg {
    id = 1802,
    propid = 160,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,135)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 135,
    probability = 80,
    min = 0,
    max = 71000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,136)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 136,
    probability = 90,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,138)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 138,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,139)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 139,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,140)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 140,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,141)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 141,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,142)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 142,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,143)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 143,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,144)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 144,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,145)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 145,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,146)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 146,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1803,160)->
    #equipment_randompropCfg {
    id = 1803,
    propid = 160,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,135)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 135,
    probability = 80,
    min = 0,
    max = 71000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,136)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 136,
    probability = 90,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,138)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 138,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,139)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 139,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,140)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 140,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,141)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 141,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,142)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 142,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,143)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 143,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,144)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 144,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,145)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 145,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,146)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 146,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1804,160)->
    #equipment_randompropCfg {
    id = 1804,
    propid = 160,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,135)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 135,
    probability = 80,
    min = 0,
    max = 71000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,137)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 137,
    probability = 90,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,138)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 138,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,139)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 139,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,140)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 140,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,141)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 141,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,142)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 142,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,143)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 143,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,144)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 144,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,145)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 145,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,146)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 146,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1805,160)->
    #equipment_randompropCfg {
    id = 1805,
    propid = 160,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,135)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 135,
    probability = 80,
    min = 0,
    max = 71000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,137)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 137,
    probability = 90,
    min = 0,
    max = 6310,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,138)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 138,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,139)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 139,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,140)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 140,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,141)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 141,
    probability = 50,
    min = 0,
    max = 7890,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,142)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 142,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,143)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 143,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,144)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 144,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,145)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 145,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,146)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 146,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1806,160)->
    #equipment_randompropCfg {
    id = 1806,
    propid = 160,
    probability = 50,
    min = 0,
    max = 9470,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,135)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 135,
    probability = 80,
    min = 0,
    max = 27000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,137)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 137,
    probability = 90,
    min = 0,
    max = 2370,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,138)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 138,
    probability = 50,
    min = 0,
    max = 3850,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,139)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 139,
    probability = 50,
    min = 0,
    max = 3850,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,140)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 140,
    probability = 50,
    min = 0,
    max = 2960,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,141)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 141,
    probability = 50,
    min = 0,
    max = 2960,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,142)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 142,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,143)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 143,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,144)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 144,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,145)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 145,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,146)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 146,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1807,160)->
    #equipment_randompropCfg {
    id = 1807,
    propid = 160,
    probability = 50,
    min = 0,
    max = 3550,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,135)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 135,
    probability = 80,
    min = 0,
    max = 30000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,136)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 136,
    probability = 90,
    min = 0,
    max = 2670,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,138)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 138,
    probability = 50,
    min = 0,
    max = 4340,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,139)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 139,
    probability = 50,
    min = 0,
    max = 4340,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,140)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 140,
    probability = 50,
    min = 0,
    max = 3340,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,141)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 141,
    probability = 50,
    min = 0,
    max = 3340,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,142)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 142,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,143)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 143,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,144)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 144,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,145)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 145,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,146)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 146,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1902,160)->
    #equipment_randompropCfg {
    id = 1902,
    propid = 160,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,135)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 135,
    probability = 80,
    min = 0,
    max = 80000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,136)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 136,
    probability = 90,
    min = 0,
    max = 7130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,138)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 138,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,139)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 139,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,140)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 140,
    probability = 50,
    min = 0,
    max = 8910,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,141)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 141,
    probability = 50,
    min = 0,
    max = 8910,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,142)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 142,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,143)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 143,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,144)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 144,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,145)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 145,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,146)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 146,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1903,160)->
    #equipment_randompropCfg {
    id = 1903,
    propid = 160,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,135)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 135,
    probability = 80,
    min = 0,
    max = 80000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,137)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 137,
    probability = 90,
    min = 0,
    max = 7130,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,138)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 138,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,139)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 139,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,140)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 140,
    probability = 50,
    min = 0,
    max = 8910,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,141)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 141,
    probability = 50,
    min = 0,
    max = 8910,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,142)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 142,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,143)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 143,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,144)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 144,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,145)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 145,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,146)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 146,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1905,160)->
    #equipment_randompropCfg {
    id = 1905,
    propid = 160,
    probability = 50,
    min = 0,
    max = 11000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,135)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 135,
    probability = 80,
    min = 0,
    max = 30000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,137)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 137,
    probability = 90,
    min = 0,
    max = 2670,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,138)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 138,
    probability = 50,
    min = 0,
    max = 4340,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,139)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 139,
    probability = 50,
    min = 0,
    max = 4340,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,140)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 140,
    probability = 50,
    min = 0,
    max = 3340,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,141)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 141,
    probability = 50,
    min = 0,
    max = 3340,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,142)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 142,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,143)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 143,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,144)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 144,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,145)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 145,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,146)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 146,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(1907,160)->
    #equipment_randompropCfg {
    id = 1907,
    propid = 160,
    probability = 50,
    min = 0,
    max = 4010,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,135)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 135,
    probability = 80,
    min = 0,
    max = 34000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,136)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 136,
    probability = 90,
    min = 0,
    max = 3000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,138)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 138,
    probability = 50,
    min = 0,
    max = 4880,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,139)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 139,
    probability = 50,
    min = 0,
    max = 4880,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,140)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 140,
    probability = 50,
    min = 0,
    max = 3750,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,141)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 141,
    probability = 50,
    min = 0,
    max = 3750,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,142)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 142,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,143)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 143,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,144)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 144,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,145)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 145,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,146)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 146,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2002,160)->
    #equipment_randompropCfg {
    id = 2002,
    propid = 160,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,135)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 135,
    probability = 80,
    min = 0,
    max = 90000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,136)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 136,
    probability = 90,
    min = 0,
    max = 8000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,138)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 138,
    probability = 50,
    min = 0,
    max = 13000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,139)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 139,
    probability = 50,
    min = 0,
    max = 13000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,140)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 140,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,141)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 141,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,142)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 142,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,143)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 143,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,144)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 144,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,145)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 145,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,146)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 146,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2003,160)->
    #equipment_randompropCfg {
    id = 2003,
    propid = 160,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,135)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 135,
    probability = 80,
    min = 0,
    max = 90000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,136)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 136,
    probability = 90,
    min = 0,
    max = 8000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,138)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 138,
    probability = 50,
    min = 0,
    max = 13000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,139)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 139,
    probability = 50,
    min = 0,
    max = 13000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,140)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 140,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,141)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 141,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,142)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 142,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,143)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 143,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,144)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 144,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,145)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 145,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,146)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 146,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2004,160)->
    #equipment_randompropCfg {
    id = 2004,
    propid = 160,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,135)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 135,
    probability = 80,
    min = 0,
    max = 90000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,137)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 137,
    probability = 90,
    min = 0,
    max = 8000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,138)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 138,
    probability = 50,
    min = 0,
    max = 13000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,139)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 139,
    probability = 50,
    min = 0,
    max = 13000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,140)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 140,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,141)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 141,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,142)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 142,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,143)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 143,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,144)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 144,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,145)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 145,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,146)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 146,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2005,160)->
    #equipment_randompropCfg {
    id = 2005,
    propid = 160,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,135)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 135,
    probability = 80,
    min = 0,
    max = 90000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,137)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 137,
    probability = 90,
    min = 0,
    max = 8000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,138)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 138,
    probability = 50,
    min = 0,
    max = 13000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,139)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 139,
    probability = 50,
    min = 0,
    max = 13000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,140)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 140,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,141)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 141,
    probability = 50,
    min = 0,
    max = 10000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,142)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 142,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,143)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 143,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,144)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 144,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,145)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 145,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,146)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 146,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2006,160)->
    #equipment_randompropCfg {
    id = 2006,
    propid = 160,
    probability = 50,
    min = 0,
    max = 12000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,135)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 135,
    probability = 80,
    min = 0,
    max = 34000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,137)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 137,
    probability = 90,
    min = 0,
    max = 3000,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,138)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 138,
    probability = 50,
    min = 0,
    max = 4880,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,139)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 139,
    probability = 50,
    min = 0,
    max = 4880,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,140)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 140,
    probability = 50,
    min = 0,
    max = 3750,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,141)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 141,
    probability = 50,
    min = 0,
    max = 3750,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,142)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 142,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,143)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 143,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,144)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 144,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,145)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 145,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,146)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 146,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(2007,160)->
    #equipment_randompropCfg {
    id = 2007,
    propid = 160,
    probability = 50,
    min = 0,
    max = 4500,
    prop_probability = [{10,30,1000},{30,60,100},{60,80,100},{80,100,100}]
    };
getRow(_,_)->[].

getKeyList()->[
    {403,135},
    {403,136},
    {403,138},
    {403,139},
    {403,140},
    {403,141},
    {403,142},
    {403,143},
    {403,144},
    {403,145},
    {403,146},
    {403,160},
    {405,135},
    {405,137},
    {405,138},
    {405,139},
    {405,140},
    {405,141},
    {405,142},
    {405,143},
    {405,144},
    {405,145},
    {405,146},
    {405,160},
    {604,135},
    {604,136},
    {604,138},
    {604,139},
    {604,140},
    {604,141},
    {604,142},
    {604,143},
    {604,144},
    {604,145},
    {604,146},
    {604,160},
    {606,135},
    {606,137},
    {606,138},
    {606,139},
    {606,140},
    {606,141},
    {606,142},
    {606,143},
    {606,144},
    {606,145},
    {606,146},
    {606,160},
    {652,135},
    {652,136},
    {652,138},
    {652,139},
    {652,140},
    {652,141},
    {652,142},
    {652,143},
    {652,144},
    {652,145},
    {652,146},
    {652,160},
    {653,135},
    {653,136},
    {653,138},
    {653,139},
    {653,140},
    {653,141},
    {653,142},
    {653,143},
    {653,144},
    {653,145},
    {653,146},
    {653,160},
    {655,135},
    {655,137},
    {655,138},
    {655,139},
    {655,140},
    {655,141},
    {655,142},
    {655,143},
    {655,144},
    {655,145},
    {655,146},
    {655,160},
    {657,135},
    {657,137},
    {657,138},
    {657,139},
    {657,140},
    {657,141},
    {657,142},
    {657,143},
    {657,144},
    {657,145},
    {657,146},
    {657,160},
    {902,135},
    {902,136},
    {902,138},
    {902,139},
    {902,140},
    {902,141},
    {902,142},
    {902,143},
    {902,144},
    {902,145},
    {902,146},
    {902,160},
    {903,135},
    {903,136},
    {903,138},
    {903,139},
    {903,140},
    {903,141},
    {903,142},
    {903,143},
    {903,144},
    {903,145},
    {903,146},
    {903,160},
    {905,135},
    {905,137},
    {905,138},
    {905,139},
    {905,140},
    {905,141},
    {905,142},
    {905,143},
    {905,144},
    {905,145},
    {905,146},
    {905,160},
    {907,135},
    {907,137},
    {907,138},
    {907,139},
    {907,140},
    {907,141},
    {907,142},
    {907,143},
    {907,144},
    {907,145},
    {907,146},
    {907,160},
    {1102,135},
    {1102,136},
    {1102,138},
    {1102,139},
    {1102,140},
    {1102,141},
    {1102,142},
    {1102,143},
    {1102,144},
    {1102,145},
    {1102,146},
    {1102,160},
    {1103,135},
    {1103,136},
    {1103,138},
    {1103,139},
    {1103,140},
    {1103,141},
    {1103,142},
    {1103,143},
    {1103,144},
    {1103,145},
    {1103,146},
    {1103,160},
    {1105,135},
    {1105,137},
    {1105,138},
    {1105,139},
    {1105,140},
    {1105,141},
    {1105,142},
    {1105,143},
    {1105,144},
    {1105,145},
    {1105,146},
    {1105,160},
    {1107,135},
    {1107,137},
    {1107,138},
    {1107,139},
    {1107,140},
    {1107,141},
    {1107,142},
    {1107,143},
    {1107,144},
    {1107,145},
    {1107,146},
    {1107,160},
    {1204,135},
    {1204,136},
    {1204,138},
    {1204,139},
    {1204,140},
    {1204,141},
    {1204,142},
    {1204,143},
    {1204,144},
    {1204,145},
    {1204,146},
    {1204,160},
    {1206,135},
    {1206,137},
    {1206,138},
    {1206,139},
    {1206,140},
    {1206,141},
    {1206,142},
    {1206,143},
    {1206,144},
    {1206,145},
    {1206,146},
    {1206,160},
    {1252,135},
    {1252,136},
    {1252,138},
    {1252,139},
    {1252,140},
    {1252,141},
    {1252,142},
    {1252,143},
    {1252,144},
    {1252,145},
    {1252,146},
    {1252,160},
    {1253,135},
    {1253,136},
    {1253,138},
    {1253,139},
    {1253,140},
    {1253,141},
    {1253,142},
    {1253,143},
    {1253,144},
    {1253,145},
    {1253,146},
    {1253,160},
    {1255,135},
    {1255,137},
    {1255,138},
    {1255,139},
    {1255,140},
    {1255,141},
    {1255,142},
    {1255,143},
    {1255,144},
    {1255,145},
    {1255,146},
    {1255,160},
    {1257,135},
    {1257,137},
    {1257,138},
    {1257,139},
    {1257,140},
    {1257,141},
    {1257,142},
    {1257,143},
    {1257,144},
    {1257,145},
    {1257,146},
    {1257,160},
    {1402,135},
    {1402,136},
    {1402,138},
    {1402,139},
    {1402,140},
    {1402,141},
    {1402,142},
    {1402,143},
    {1402,144},
    {1402,145},
    {1402,146},
    {1402,160},
    {1403,135},
    {1403,136},
    {1403,138},
    {1403,139},
    {1403,140},
    {1403,141},
    {1403,142},
    {1403,143},
    {1403,144},
    {1403,145},
    {1403,146},
    {1403,160},
    {1405,135},
    {1405,137},
    {1405,138},
    {1405,139},
    {1405,140},
    {1405,141},
    {1405,142},
    {1405,143},
    {1405,144},
    {1405,145},
    {1405,146},
    {1405,160},
    {1407,135},
    {1407,137},
    {1407,138},
    {1407,139},
    {1407,140},
    {1407,141},
    {1407,142},
    {1407,143},
    {1407,144},
    {1407,145},
    {1407,146},
    {1407,160},
    {1502,135},
    {1502,136},
    {1502,138},
    {1502,139},
    {1502,140},
    {1502,141},
    {1502,142},
    {1502,143},
    {1502,144},
    {1502,145},
    {1502,146},
    {1502,160},
    {1503,135},
    {1503,136},
    {1503,138},
    {1503,139},
    {1503,140},
    {1503,141},
    {1503,142},
    {1503,143},
    {1503,144},
    {1503,145},
    {1503,146},
    {1503,160},
    {1504,135},
    {1504,136},
    {1504,138},
    {1504,139},
    {1504,140},
    {1504,141},
    {1504,142},
    {1504,143},
    {1504,144},
    {1504,145},
    {1504,146},
    {1504,160},
    {1505,135},
    {1505,137},
    {1505,138},
    {1505,139},
    {1505,140},
    {1505,141},
    {1505,142},
    {1505,143},
    {1505,144},
    {1505,145},
    {1505,146},
    {1505,160},
    {1506,135},
    {1506,137},
    {1506,138},
    {1506,139},
    {1506,140},
    {1506,141},
    {1506,142},
    {1506,143},
    {1506,144},
    {1506,145},
    {1506,146},
    {1506,160},
    {1507,135},
    {1507,137},
    {1507,138},
    {1507,139},
    {1507,140},
    {1507,141},
    {1507,142},
    {1507,143},
    {1507,144},
    {1507,145},
    {1507,146},
    {1507,160},
    {1602,135},
    {1602,136},
    {1602,138},
    {1602,139},
    {1602,140},
    {1602,141},
    {1602,142},
    {1602,143},
    {1602,144},
    {1602,145},
    {1602,146},
    {1602,160},
    {1603,135},
    {1603,136},
    {1603,138},
    {1603,139},
    {1603,140},
    {1603,141},
    {1603,142},
    {1603,143},
    {1603,144},
    {1603,145},
    {1603,146},
    {1603,160},
    {1605,135},
    {1605,137},
    {1605,138},
    {1605,139},
    {1605,140},
    {1605,141},
    {1605,142},
    {1605,143},
    {1605,144},
    {1605,145},
    {1605,146},
    {1605,160},
    {1607,135},
    {1607,137},
    {1607,138},
    {1607,139},
    {1607,140},
    {1607,141},
    {1607,142},
    {1607,143},
    {1607,144},
    {1607,145},
    {1607,146},
    {1607,160},
    {1702,135},
    {1702,136},
    {1702,138},
    {1702,139},
    {1702,140},
    {1702,141},
    {1702,142},
    {1702,143},
    {1702,144},
    {1702,145},
    {1702,146},
    {1702,160},
    {1703,135},
    {1703,136},
    {1703,138},
    {1703,139},
    {1703,140},
    {1703,141},
    {1703,142},
    {1703,143},
    {1703,144},
    {1703,145},
    {1703,146},
    {1703,160},
    {1705,135},
    {1705,137},
    {1705,138},
    {1705,139},
    {1705,140},
    {1705,141},
    {1705,142},
    {1705,143},
    {1705,144},
    {1705,145},
    {1705,146},
    {1705,160},
    {1707,135},
    {1707,137},
    {1707,138},
    {1707,139},
    {1707,140},
    {1707,141},
    {1707,142},
    {1707,143},
    {1707,144},
    {1707,145},
    {1707,146},
    {1707,160},
    {1802,135},
    {1802,136},
    {1802,138},
    {1802,139},
    {1802,140},
    {1802,141},
    {1802,142},
    {1802,143},
    {1802,144},
    {1802,145},
    {1802,146},
    {1802,160},
    {1803,135},
    {1803,136},
    {1803,138},
    {1803,139},
    {1803,140},
    {1803,141},
    {1803,142},
    {1803,143},
    {1803,144},
    {1803,145},
    {1803,146},
    {1803,160},
    {1804,135},
    {1804,136},
    {1804,138},
    {1804,139},
    {1804,140},
    {1804,141},
    {1804,142},
    {1804,143},
    {1804,144},
    {1804,145},
    {1804,146},
    {1804,160},
    {1805,135},
    {1805,137},
    {1805,138},
    {1805,139},
    {1805,140},
    {1805,141},
    {1805,142},
    {1805,143},
    {1805,144},
    {1805,145},
    {1805,146},
    {1805,160},
    {1806,135},
    {1806,137},
    {1806,138},
    {1806,139},
    {1806,140},
    {1806,141},
    {1806,142},
    {1806,143},
    {1806,144},
    {1806,145},
    {1806,146},
    {1806,160},
    {1807,135},
    {1807,137},
    {1807,138},
    {1807,139},
    {1807,140},
    {1807,141},
    {1807,142},
    {1807,143},
    {1807,144},
    {1807,145},
    {1807,146},
    {1807,160},
    {1902,135},
    {1902,136},
    {1902,138},
    {1902,139},
    {1902,140},
    {1902,141},
    {1902,142},
    {1902,143},
    {1902,144},
    {1902,145},
    {1902,146},
    {1902,160},
    {1903,135},
    {1903,136},
    {1903,138},
    {1903,139},
    {1903,140},
    {1903,141},
    {1903,142},
    {1903,143},
    {1903,144},
    {1903,145},
    {1903,146},
    {1903,160},
    {1905,135},
    {1905,137},
    {1905,138},
    {1905,139},
    {1905,140},
    {1905,141},
    {1905,142},
    {1905,143},
    {1905,144},
    {1905,145},
    {1905,146},
    {1905,160},
    {1907,135},
    {1907,137},
    {1907,138},
    {1907,139},
    {1907,140},
    {1907,141},
    {1907,142},
    {1907,143},
    {1907,144},
    {1907,145},
    {1907,146},
    {1907,160},
    {2002,135},
    {2002,136},
    {2002,138},
    {2002,139},
    {2002,140},
    {2002,141},
    {2002,142},
    {2002,143},
    {2002,144},
    {2002,145},
    {2002,146},
    {2002,160},
    {2003,135},
    {2003,136},
    {2003,138},
    {2003,139},
    {2003,140},
    {2003,141},
    {2003,142},
    {2003,143},
    {2003,144},
    {2003,145},
    {2003,146},
    {2003,160},
    {2004,135},
    {2004,136},
    {2004,138},
    {2004,139},
    {2004,140},
    {2004,141},
    {2004,142},
    {2004,143},
    {2004,144},
    {2004,145},
    {2004,146},
    {2004,160},
    {2005,135},
    {2005,137},
    {2005,138},
    {2005,139},
    {2005,140},
    {2005,141},
    {2005,142},
    {2005,143},
    {2005,144},
    {2005,145},
    {2005,146},
    {2005,160},
    {2006,135},
    {2006,137},
    {2006,138},
    {2006,139},
    {2006,140},
    {2006,141},
    {2006,142},
    {2006,143},
    {2006,144},
    {2006,145},
    {2006,146},
    {2006,160},
    {2007,135},
    {2007,137},
    {2007,138},
    {2007,139},
    {2007,140},
    {2007,141},
    {2007,142},
    {2007,143},
    {2007,144},
    {2007,145},
    {2007,146},
    {2007,160}
    ].

get1KeyList()->[
    403,
    405,
    604,
    606,
    652,
    653,
    655,
    657,
    902,
    903,
    905,
    907,
    1102,
    1103,
    1105,
    1107,
    1204,
    1206,
    1252,
    1253,
    1255,
    1257,
    1402,
    1403,
    1405,
    1407,
    1502,
    1503,
    1504,
    1505,
    1506,
    1507,
    1602,
    1603,
    1605,
    1607,
    1702,
    1703,
    1705,
    1707,
    1802,
    1803,
    1804,
    1805,
    1806,
    1807,
    1902,
    1903,
    1905,
    1907,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007
    ].

get2KeyList(403)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(405)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(604)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(606)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(652)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(653)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(655)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(657)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(902)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(903)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(905)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(907)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1102)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1103)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1105)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1107)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1204)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1206)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1252)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1253)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1255)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1257)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1402)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1403)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1405)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1407)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1502)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1503)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1504)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1505)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1506)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1507)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1602)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1603)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1605)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1607)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1702)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1703)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1705)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1707)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1802)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1803)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1804)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1805)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1806)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1807)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1902)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1903)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1905)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(1907)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(2002)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(2003)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(2004)->[
    135,
    136,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(2005)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(2006)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(2007)->[
    135,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    160
    ];
get2KeyList(_)->[].

