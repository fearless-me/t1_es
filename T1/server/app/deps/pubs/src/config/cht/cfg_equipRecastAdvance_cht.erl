%% coding: latin-1
%%: 实现
-module(cfg_equipRecastAdvance_cht).
-compile(export_all).
-include("cfg_equipRecastAdvance.hrl").
-include("logger.hrl").

getRow(1,101,29)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 101,
    level = 29,
    props_1 = [140,1111,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [136,1112,0,348],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1113,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(1,101,45)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 101,
    level = 45,
    props_1 = [140,1211,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [136,1212,0,348,957],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [136,1213,0,495,1360],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(1,101,60)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 101,
    level = 60,
    props_1 = [140,1311,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [136,1312,0,348,957,1340],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [136,1313,0,495,1360,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(1,101,70)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 101,
    level = 70,
    props_1 = [140,1411,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [136,1412,0,348,957,1340,1740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [136,1413,0,495,1360,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(1,201,29)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 201,
    level = 29,
    props_1 = [140,1111,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [137,1112,0,348],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [137,1113,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(1,201,45)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 201,
    level = 45,
    props_1 = [140,1211,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [137,1212,0,348,957],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [137,1213,0,495,1370],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(1,201,60)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 201,
    level = 60,
    props_1 = [140,1311,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [137,1312,0,348,957,1340],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [137,1313,0,495,1370,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(1,201,70)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 201,
    level = 70,
    props_1 = [140,1411,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [137,1412,0,348,957,1340,1740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [137,1413,0,495,1370,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(1,301,29)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 301,
    level = 29,
    props_1 = [140,1111,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [136,1112,0,348],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1113,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(1,301,45)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 301,
    level = 45,
    props_1 = [140,1211,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [136,1212,0,348,957],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [136,1213,0,495,1360],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(1,301,60)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 301,
    level = 60,
    props_1 = [140,1311,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [136,1312,0,348,957,1340],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [136,1313,0,495,1360,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(1,301,70)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 301,
    level = 70,
    props_1 = [140,1411,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [136,1412,0,348,957,1340,1740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [136,1413,0,495,1360,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(2,101,29)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 101,
    level = 29,
    props_1 = [141,1121,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [135,1122,0,4681],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1123,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(2,101,45)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 101,
    level = 45,
    props_1 = [141,1221,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [135,1222,0,4681,12873],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1223,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(2,101,60)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 101,
    level = 60,
    props_1 = [141,1321,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [135,1322,0,4681,12873,18022],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1323,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(2,101,70)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 101,
    level = 70,
    props_1 = [141,1421,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [135,1422,0,4681,12873,18022,23405],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1423,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(2,201,29)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 201,
    level = 29,
    props_1 = [141,1121,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [135,1122,0,4681],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1123,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(2,201,45)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 201,
    level = 45,
    props_1 = [141,1221,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [135,1222,0,4681,12873],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1223,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(2,201,60)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 201,
    level = 60,
    props_1 = [141,1321,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [135,1322,0,4681,12873,18022],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1323,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(2,201,70)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 201,
    level = 70,
    props_1 = [141,1421,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [135,1422,0,4681,12873,18022,23405],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1423,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(2,301,29)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 301,
    level = 29,
    props_1 = [141,1121,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [135,1122,0,4681],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1123,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(2,301,45)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 301,
    level = 45,
    props_1 = [141,1221,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [135,1222,0,4681,12873],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1223,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(2,301,60)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 301,
    level = 60,
    props_1 = [141,1321,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [135,1322,0,4681,12873,18022],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1323,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(2,301,70)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 301,
    level = 70,
    props_1 = [141,1421,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [135,1422,0,4681,12873,18022,23405],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1423,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(3,101,29)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 101,
    level = 29,
    props_1 = [142,1131,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [136,1132,0,348],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1133,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(3,101,45)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 101,
    level = 45,
    props_1 = [142,1231,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [136,1232,0,348,957],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [136,1233,0,495,1360],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(3,101,60)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 101,
    level = 60,
    props_1 = [142,1331,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [136,1332,0,348,957,1340],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [136,1333,0,495,1360,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(3,101,70)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 101,
    level = 70,
    props_1 = [142,1431,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [136,1432,0,348,957,1340,1740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [136,1433,0,495,1360,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(3,201,29)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 201,
    level = 29,
    props_1 = [142,1131,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [137,1132,0,348],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [137,1133,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(3,201,45)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 201,
    level = 45,
    props_1 = [142,1231,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [137,1232,0,348,957],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [137,1233,0,495,1370],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(3,201,60)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 201,
    level = 60,
    props_1 = [142,1331,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [137,1332,0,348,957,1340],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [137,1333,0,495,1370,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(3,201,70)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 201,
    level = 70,
    props_1 = [142,1431,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [137,1432,0,348,957,1340,1740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [137,1433,0,495,1370,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(3,301,29)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 301,
    level = 29,
    props_1 = [142,1131,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [136,1132,0,348],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1133,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(3,301,45)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 301,
    level = 45,
    props_1 = [142,1231,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [136,1232,0,348,957],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [136,1233,0,495,1360],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(3,301,60)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 301,
    level = 60,
    props_1 = [142,1331,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [136,1332,0,348,957,1340],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [136,1333,0,495,1360,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(3,301,70)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 301,
    level = 70,
    props_1 = [142,1431,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [136,1432,0,348,957,1340,1740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [136,1433,0,495,1360,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(4,101,29)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 101,
    level = 29,
    props_1 = [160,1141,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [135,1142,0,4681],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1143,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(4,101,45)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 101,
    level = 45,
    props_1 = [160,1241,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [135,1242,0,4681,12873],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1243,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(4,101,60)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 101,
    level = 60,
    props_1 = [160,1341,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [135,1342,0,4681,12873,18022],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1343,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(4,101,70)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 101,
    level = 70,
    props_1 = [160,1441,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [135,1442,0,4681,12873,18022,23405],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1443,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(4,201,29)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 201,
    level = 29,
    props_1 = [160,1141,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [135,1142,0,4681],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1143,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(4,201,45)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 201,
    level = 45,
    props_1 = [160,1241,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [135,1242,0,4681,12873],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1243,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(4,201,60)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 201,
    level = 60,
    props_1 = [160,1341,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [135,1342,0,4681,12873,18022],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1343,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(4,201,70)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 201,
    level = 70,
    props_1 = [160,1441,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [135,1442,0,4681,12873,18022,23405],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1443,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(4,301,29)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 301,
    level = 29,
    props_1 = [160,1141,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [135,1142,0,4681],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1143,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(4,301,45)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 301,
    level = 45,
    props_1 = [160,1241,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [135,1242,0,4681,12873],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1243,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(4,301,60)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 301,
    level = 60,
    props_1 = [160,1341,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [135,1342,0,4681,12873,18022],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1343,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(4,301,70)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 301,
    level = 70,
    props_1 = [160,1441,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [135,1442,0,4681,12873,18022,23405],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1443,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(5,101,29)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 101,
    level = 29,
    props_1 = [146,1151,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1152,0,1360],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1153,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(5,101,45)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 101,
    level = 45,
    props_1 = [146,1251,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [138,1252,0,1360,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [136,1253,0,495,1360],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(5,101,60)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 101,
    level = 60,
    props_1 = [146,1351,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [138,1352,0,1360,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [136,1353,0,495,1360,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(5,101,70)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 101,
    level = 70,
    props_1 = [146,1451,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [138,1452,0,1360,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [136,1453,0,495,1360,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(5,201,29)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 201,
    level = 29,
    props_1 = [146,1151,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1152,0,1370],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [137,1153,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(5,201,45)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 201,
    level = 45,
    props_1 = [146,1251,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [138,1252,0,1370,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [137,1253,0,495,1370],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(5,201,60)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 201,
    level = 60,
    props_1 = [146,1351,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [138,1352,0,1370,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [137,1353,0,495,1370,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(5,201,70)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 201,
    level = 70,
    props_1 = [146,1451,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [138,1452,0,1370,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [137,1453,0,495,1370,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(5,301,29)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 301,
    level = 29,
    props_1 = [146,1151,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1152,0,1360],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1153,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(5,301,45)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 301,
    level = 45,
    props_1 = [146,1251,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [138,1252,0,1360,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [136,1253,0,495,1360],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(5,301,60)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 301,
    level = 60,
    props_1 = [146,1351,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [138,1352,0,1360,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [136,1353,0,495,1360,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(5,301,70)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 301,
    level = 70,
    props_1 = [146,1451,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [138,1452,0,1360,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [136,1453,0,495,1360,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(6,101,29)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 101,
    level = 29,
    props_1 = [143,1161,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1162,0,1360],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1163,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(6,101,45)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 101,
    level = 45,
    props_1 = [143,1261,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [138,1262,0,1360,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1263,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(6,101,60)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 101,
    level = 60,
    props_1 = [143,1361,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [138,1362,0,1360,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1363,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(6,101,70)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 101,
    level = 70,
    props_1 = [143,1461,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [138,1462,0,1360,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1463,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(6,201,29)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 201,
    level = 29,
    props_1 = [143,1161,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1162,0,1370],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1163,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(6,201,45)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 201,
    level = 45,
    props_1 = [143,1261,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [138,1262,0,1370,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1263,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(6,201,60)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 201,
    level = 60,
    props_1 = [143,1371,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [138,1372,0,1370,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1373,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(6,201,70)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 201,
    level = 70,
    props_1 = [143,1461,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [138,1462,0,1370,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1463,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(6,301,29)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 301,
    level = 29,
    props_1 = [143,1161,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1162,0,1360],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1163,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(6,301,45)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 301,
    level = 45,
    props_1 = [143,1261,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [138,1262,0,1360,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1263,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(6,301,60)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 301,
    level = 60,
    props_1 = [143,1361,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [138,1362,0,1360,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1363,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(6,301,70)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 301,
    level = 70,
    props_1 = [143,1461,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [138,1462,0,1360,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1463,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(7,101,29)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 101,
    level = 29,
    props_1 = [144,1171,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1172,0,1360],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1173,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(7,101,45)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 101,
    level = 45,
    props_1 = [144,1271,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [139,1272,0,1360,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [136,1273,0,495,1360],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(7,101,60)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 101,
    level = 60,
    props_1 = [144,1371,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [139,1372,0,1360,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [136,1373,0,495,1360,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(7,101,70)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 101,
    level = 70,
    props_1 = [144,1471,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [139,1472,0,1360,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [136,1473,0,495,1360,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(7,201,29)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 201,
    level = 29,
    props_1 = [144,1171,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1172,0,1370],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [137,1173,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(7,201,45)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 201,
    level = 45,
    props_1 = [144,1271,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [139,1272,0,1370,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [137,1273,0,495,1370],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(7,201,60)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 201,
    level = 60,
    props_1 = [144,1371,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [139,1372,0,1370,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [137,1373,0,495,1370,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(7,201,70)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 201,
    level = 70,
    props_1 = [144,1471,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [139,1472,0,1370,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [137,1473,0,495,1370,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(7,301,29)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 301,
    level = 29,
    props_1 = [144,1171,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1172,0,1360],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1173,0,495],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(7,301,45)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 301,
    level = 45,
    props_1 = [144,1271,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [139,1272,0,1360,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [136,1273,0,495,1360],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(7,301,60)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 301,
    level = 60,
    props_1 = [144,1371,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [139,1372,0,1360,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [136,1373,0,495,1360,1900],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(7,301,70)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 301,
    level = 70,
    props_1 = [144,1471,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [139,1472,0,1360,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [136,1473,0,495,1360,1900,2470],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(8,101,29)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 101,
    level = 29,
    props_1 = [145,1181,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1182,0,1360],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1183,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(8,101,45)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 101,
    level = 45,
    props_1 = [145,1281,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [139,1282,0,1360,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1283,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(8,101,60)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 101,
    level = 60,
    props_1 = [145,1381,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [139,1382,0,1360,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1383,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(8,101,70)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 101,
    level = 70,
    props_1 = [145,1481,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [139,1482,0,1360,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1483,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(8,201,29)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 201,
    level = 29,
    props_1 = [145,1181,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1182,0,1370],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1183,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(8,201,45)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 201,
    level = 45,
    props_1 = [145,1281,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [139,1282,0,1370,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1283,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(8,201,60)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 201,
    level = 60,
    props_1 = [145,1381,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [139,1382,0,1370,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1383,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(8,201,70)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 201,
    level = 70,
    props_1 = [145,1481,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [139,1482,0,1370,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1483,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(8,301,29)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 301,
    level = 29,
    props_1 = [145,1181,0,1150],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1182,0,1360],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1183,0,5461],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(8,301,45)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 301,
    level = 45,
    props_1 = [145,1281,0,1150,3163],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3}],
    props_2 = [139,1282,0,1360,3740],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3}],
    props_3 = [135,1283,0,5461,15020],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3}]
    };
getRow(8,301,60)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 301,
    level = 60,
    props_1 = [145,1381,0,1150,3163,4428],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6}],
    props_2 = [139,1382,0,1360,3740,5236],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6}],
    props_3 = [135,1383,0,5461,15020,21030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6}]
    };
getRow(8,301,70)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 301,
    level = 70,
    props_1 = [145,1481,0,1150,3163,4428,5751],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,3},{241,6},{241,8}],
    props_2 = [139,1482,0,1360,3740,5236,6800],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,3},{241,6},{241,8}],
    props_3 = [135,1483,0,5461,15020,21030,27310],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,3},{241,6},{241,8}]
    };
getRow(_,_,_)->[].

getKeyList()->[
    {1,101,29},
    {1,101,45},
    {1,101,60},
    {1,101,70},
    {1,201,29},
    {1,201,45},
    {1,201,60},
    {1,201,70},
    {1,301,29},
    {1,301,45},
    {1,301,60},
    {1,301,70},
    {2,101,29},
    {2,101,45},
    {2,101,60},
    {2,101,70},
    {2,201,29},
    {2,201,45},
    {2,201,60},
    {2,201,70},
    {2,301,29},
    {2,301,45},
    {2,301,60},
    {2,301,70},
    {3,101,29},
    {3,101,45},
    {3,101,60},
    {3,101,70},
    {3,201,29},
    {3,201,45},
    {3,201,60},
    {3,201,70},
    {3,301,29},
    {3,301,45},
    {3,301,60},
    {3,301,70},
    {4,101,29},
    {4,101,45},
    {4,101,60},
    {4,101,70},
    {4,201,29},
    {4,201,45},
    {4,201,60},
    {4,201,70},
    {4,301,29},
    {4,301,45},
    {4,301,60},
    {4,301,70},
    {5,101,29},
    {5,101,45},
    {5,101,60},
    {5,101,70},
    {5,201,29},
    {5,201,45},
    {5,201,60},
    {5,201,70},
    {5,301,29},
    {5,301,45},
    {5,301,60},
    {5,301,70},
    {6,101,29},
    {6,101,45},
    {6,101,60},
    {6,101,70},
    {6,201,29},
    {6,201,45},
    {6,201,60},
    {6,201,70},
    {6,301,29},
    {6,301,45},
    {6,301,60},
    {6,301,70},
    {7,101,29},
    {7,101,45},
    {7,101,60},
    {7,101,70},
    {7,201,29},
    {7,201,45},
    {7,201,60},
    {7,201,70},
    {7,301,29},
    {7,301,45},
    {7,301,60},
    {7,301,70},
    {8,101,29},
    {8,101,45},
    {8,101,60},
    {8,101,70},
    {8,201,29},
    {8,201,45},
    {8,201,60},
    {8,201,70},
    {8,301,29},
    {8,301,45},
    {8,301,60},
    {8,301,70}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ].

get2KeyList(1)->[
    {101, 29},
    {101, 45},
    {101, 60},
    {101, 70},
    {201, 29},
    {201, 45},
    {201, 60},
    {201, 70},
    {301, 29},
    {301, 45},
    {301, 60},
    {301, 70}
    ];
get2KeyList(2)->[
    {101, 29},
    {101, 45},
    {101, 60},
    {101, 70},
    {201, 29},
    {201, 45},
    {201, 60},
    {201, 70},
    {301, 29},
    {301, 45},
    {301, 60},
    {301, 70}
    ];
get2KeyList(3)->[
    {101, 29},
    {101, 45},
    {101, 60},
    {101, 70},
    {201, 29},
    {201, 45},
    {201, 60},
    {201, 70},
    {301, 29},
    {301, 45},
    {301, 60},
    {301, 70}
    ];
get2KeyList(4)->[
    {101, 29},
    {101, 45},
    {101, 60},
    {101, 70},
    {201, 29},
    {201, 45},
    {201, 60},
    {201, 70},
    {301, 29},
    {301, 45},
    {301, 60},
    {301, 70}
    ];
get2KeyList(5)->[
    {101, 29},
    {101, 45},
    {101, 60},
    {101, 70},
    {201, 29},
    {201, 45},
    {201, 60},
    {201, 70},
    {301, 29},
    {301, 45},
    {301, 60},
    {301, 70}
    ];
get2KeyList(6)->[
    {101, 29},
    {101, 45},
    {101, 60},
    {101, 70},
    {201, 29},
    {201, 45},
    {201, 60},
    {201, 70},
    {301, 29},
    {301, 45},
    {301, 60},
    {301, 70}
    ];
get2KeyList(7)->[
    {101, 29},
    {101, 45},
    {101, 60},
    {101, 70},
    {201, 29},
    {201, 45},
    {201, 60},
    {201, 70},
    {301, 29},
    {301, 45},
    {301, 60},
    {301, 70}
    ];
get2KeyList(8)->[
    {101, 29},
    {101, 45},
    {101, 60},
    {101, 70},
    {201, 29},
    {201, 45},
    {201, 60},
    {201, 70},
    {301, 29},
    {301, 45},
    {301, 60},
    {301, 70}
    ];
get2KeyList(_)->[].

get3KeyList(1,101)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(1,201)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(1,301)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(2,101)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(2,201)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(2,301)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(3,101)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(3,201)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(3,301)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(4,101)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(4,201)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(4,301)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(5,101)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(5,201)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(5,301)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(6,101)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(6,201)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(6,301)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(7,101)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(7,201)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(7,301)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(8,101)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(8,201)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(8,301)->[
    29,
    45,
    60,
    70
    ];
get3KeyList(_,_)->[].

