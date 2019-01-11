%% coding: latin-1
%%: 实现
-module(cfg_equipRecastAdvance_chs).
-compile(export_all).
-include("cfg_equipRecastAdvance.hrl").
-include("logger.hrl").

getRow(1,101,58)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 101,
    level = 58,
    props_1 = [140,1111,0,3640],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [136,1112,0,1775],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1113,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(1,101,90)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 101,
    level = 90,
    props_1 = [140,1211,0,3640,5720],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [136,1212,0,1775,2789],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [136,1213,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(1,101,120)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 101,
    level = 120,
    props_1 = [140,1311,0,3640,5720,8008],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [136,1312,0,1775,2789,3905],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [136,1313,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(1,101,140)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 101,
    level = 140,
    props_1 = [140,1411,0,3640,5720,8008,10400],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [136,1412,0,1775,2789,3905,5071],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [136,1413,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(1,201,58)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 201,
    level = 58,
    props_1 = [140,1111,0,3640],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [137,1112,0,1775],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [137,1113,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(1,201,90)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 201,
    level = 90,
    props_1 = [140,1211,0,3640,5720],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [137,1212,0,1775,2789],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [137,1213,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(1,201,120)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 201,
    level = 120,
    props_1 = [140,1311,0,3640,5720,8008],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [137,1312,0,1775,2789,3905],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [137,1313,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(1,201,140)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 201,
    level = 140,
    props_1 = [140,1411,0,3640,5720,8008,10400],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [137,1412,0,1775,2789,3905,5071],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [137,1413,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(1,301,58)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 301,
    level = 58,
    props_1 = [140,1111,0,3640],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [136,1112,0,1775],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1113,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(1,301,90)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 301,
    level = 90,
    props_1 = [140,1211,0,3640,5720],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [136,1212,0,1775,2789],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [136,1213,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(1,301,120)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 301,
    level = 120,
    props_1 = [140,1311,0,3640,5720,8008],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [136,1312,0,1775,2789,3905],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [136,1313,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(1,301,140)->
    #equipRecastAdvanceCfg {
    slot = 1,
    career = 301,
    level = 140,
    props_1 = [140,1411,0,3640,5720,8008,10400],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [136,1412,0,1775,2789,3905,5071],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [136,1413,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(2,101,58)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 101,
    level = 58,
    props_1 = [143,1121,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1122,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1123,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(2,101,90)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 101,
    level = 90,
    props_1 = [143,1221,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [139,1222,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1223,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(2,101,120)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 101,
    level = 120,
    props_1 = [143,1321,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [139,1322,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1323,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(2,101,140)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 101,
    level = 140,
    props_1 = [143,1421,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [139,1422,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1423,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(2,201,58)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 201,
    level = 58,
    props_1 = [143,1121,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1122,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1123,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(2,201,90)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 201,
    level = 90,
    props_1 = [143,1221,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [139,1222,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1223,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(2,201,120)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 201,
    level = 120,
    props_1 = [143,1321,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [139,1322,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1323,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(2,201,140)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 201,
    level = 140,
    props_1 = [143,1421,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [139,1422,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1423,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(2,301,58)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 301,
    level = 58,
    props_1 = [143,1121,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1122,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1123,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(2,301,90)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 301,
    level = 90,
    props_1 = [143,1221,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [139,1222,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1223,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(2,301,120)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 301,
    level = 120,
    props_1 = [143,1321,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [139,1322,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1323,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(2,301,140)->
    #equipRecastAdvanceCfg {
    slot = 2,
    career = 301,
    level = 140,
    props_1 = [143,1421,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [139,1422,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1423,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(3,101,58)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 101,
    level = 58,
    props_1 = [144,1131,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [140,1132,0,3640],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1133,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(3,101,90)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 101,
    level = 90,
    props_1 = [144,1231,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [140,1232,0,3640,5720],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [136,1233,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(3,101,120)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 101,
    level = 120,
    props_1 = [144,1331,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [140,1332,0,3640,5720,8008],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [136,1333,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(3,101,140)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 101,
    level = 140,
    props_1 = [144,1431,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [140,1432,0,3640,5720,8008,10400],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [136,1433,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(3,201,58)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 201,
    level = 58,
    props_1 = [144,1131,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [140,1132,0,3640],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [137,1133,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(3,201,90)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 201,
    level = 90,
    props_1 = [144,1231,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [140,1232,0,3640,5720],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [137,1233,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(3,201,120)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 201,
    level = 120,
    props_1 = [144,1331,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [140,1332,0,3640,5720,8008],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [137,1333,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(3,201,140)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 201,
    level = 140,
    props_1 = [144,1431,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [140,1432,0,3640,5720,8008,10400],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [137,1433,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(3,301,58)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 301,
    level = 58,
    props_1 = [144,1131,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [140,1132,0,3640],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1133,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(3,301,90)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 301,
    level = 90,
    props_1 = [144,1231,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [140,1232,0,3640,5720],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [136,1233,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(3,301,120)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 301,
    level = 120,
    props_1 = [144,1331,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [140,1332,0,3640,5720,8008],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [136,1333,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(3,301,140)->
    #equipRecastAdvanceCfg {
    slot = 3,
    career = 301,
    level = 140,
    props_1 = [144,1431,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [140,1432,0,3640,5720,8008,10400],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [136,1433,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(4,101,58)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 101,
    level = 58,
    props_1 = [160,1141,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1142,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1143,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(4,101,90)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 101,
    level = 90,
    props_1 = [160,1241,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [138,1242,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1243,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(4,101,120)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 101,
    level = 120,
    props_1 = [160,1341,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [138,1342,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1343,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(4,101,140)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 101,
    level = 140,
    props_1 = [160,1441,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [138,1442,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1443,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(4,201,58)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 201,
    level = 58,
    props_1 = [160,1141,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1142,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1143,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(4,201,90)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 201,
    level = 90,
    props_1 = [160,1241,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [138,1242,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1243,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(4,201,120)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 201,
    level = 120,
    props_1 = [160,1341,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [138,1342,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1343,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(4,201,140)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 201,
    level = 140,
    props_1 = [160,1441,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [138,1442,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1443,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(4,301,58)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 301,
    level = 58,
    props_1 = [160,1141,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1142,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1143,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(4,301,90)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 301,
    level = 90,
    props_1 = [160,1241,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [138,1242,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1243,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(4,301,120)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 301,
    level = 120,
    props_1 = [160,1341,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [138,1342,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1343,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(4,301,140)->
    #equipRecastAdvanceCfg {
    slot = 4,
    career = 301,
    level = 140,
    props_1 = [160,1441,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [138,1442,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1443,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(5,101,58)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 101,
    level = 58,
    props_1 = [142,1151,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [141,1152,0,3640],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1153,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(5,101,90)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 101,
    level = 90,
    props_1 = [142,1251,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [141,1252,0,3640,5720],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [136,1253,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(5,101,120)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 101,
    level = 120,
    props_1 = [142,1351,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [141,1352,0,3640,5720,8008],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [136,1353,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(5,101,140)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 101,
    level = 140,
    props_1 = [142,1451,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [141,1452,0,3640,5720,8008,10400],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [136,1453,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(5,201,58)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 201,
    level = 58,
    props_1 = [142,1151,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [141,1152,0,3640],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [137,1153,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(5,201,90)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 201,
    level = 90,
    props_1 = [142,1251,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [141,1252,0,3640,5720],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [137,1253,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(5,201,120)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 201,
    level = 120,
    props_1 = [142,1351,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [141,1352,0,3640,5720,8008],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [137,1353,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(5,201,140)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 201,
    level = 140,
    props_1 = [142,1451,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [141,1452,0,3640,5720,8008,10400],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [137,1453,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(5,301,58)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 301,
    level = 58,
    props_1 = [142,1151,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [141,1152,0,3640],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1153,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(5,301,90)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 301,
    level = 90,
    props_1 = [142,1251,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [141,1252,0,3640,5720],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [136,1253,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(5,301,120)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 301,
    level = 120,
    props_1 = [142,1351,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [141,1352,0,3640,5720,8008],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [136,1353,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(5,301,140)->
    #equipRecastAdvanceCfg {
    slot = 5,
    career = 301,
    level = 140,
    props_1 = [142,1451,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [141,1452,0,3640,5720,8008,10400],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [136,1453,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(6,101,58)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 101,
    level = 58,
    props_1 = [145,1161,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1162,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1163,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(6,101,90)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 101,
    level = 90,
    props_1 = [145,1261,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [138,1262,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1263,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(6,101,120)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 101,
    level = 120,
    props_1 = [145,1361,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [138,1362,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1363,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(6,101,140)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 101,
    level = 140,
    props_1 = [145,1461,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [138,1462,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1463,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(6,201,58)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 201,
    level = 58,
    props_1 = [145,1161,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1162,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1163,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(6,201,90)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 201,
    level = 90,
    props_1 = [145,1261,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [138,1262,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1263,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(6,201,120)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 201,
    level = 120,
    props_1 = [145,1371,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [138,1372,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1373,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(6,201,140)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 201,
    level = 140,
    props_1 = [145,1461,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [138,1462,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1463,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(6,301,58)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 301,
    level = 58,
    props_1 = [145,1161,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [138,1162,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1163,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(6,301,90)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 301,
    level = 90,
    props_1 = [145,1261,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [138,1262,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1263,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(6,301,120)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 301,
    level = 120,
    props_1 = [145,1361,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [138,1362,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1363,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(6,301,140)->
    #equipRecastAdvanceCfg {
    slot = 6,
    career = 301,
    level = 140,
    props_1 = [145,1461,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [138,1462,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1463,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(7,101,58)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 101,
    level = 58,
    props_1 = [141,1171,0,3640],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [135,1172,0,26618],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1173,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(7,101,90)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 101,
    level = 90,
    props_1 = [141,1271,0,3640,5720],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [135,1272,0,26618,41828],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [136,1273,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(7,101,120)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 101,
    level = 120,
    props_1 = [141,1371,0,3640,5720,8008],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [135,1372,0,26618,41828,58559],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [136,1373,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(7,101,140)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 101,
    level = 140,
    props_1 = [141,1471,0,3640,5720,8008,10400],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [135,1472,0,26618,41828,58559,76051],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [136,1473,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(7,201,58)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 201,
    level = 58,
    props_1 = [141,1171,0,3640],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [135,1172,0,26618],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [137,1173,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(7,201,90)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 201,
    level = 90,
    props_1 = [141,1271,0,3640,5720],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [135,1272,0,26618,41828],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [137,1273,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(7,201,120)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 201,
    level = 120,
    props_1 = [141,1371,0,3640,5720,8008],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [135,1372,0,26618,41828,58559],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [137,1373,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(7,201,140)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 201,
    level = 140,
    props_1 = [141,1471,0,3640,5720,8008,10400],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [135,1472,0,26618,41828,58559,76051],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [137,1473,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(7,301,58)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 301,
    level = 58,
    props_1 = [141,1171,0,3640],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [135,1172,0,26618],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [136,1173,0,1831],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(7,301,90)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 301,
    level = 90,
    props_1 = [141,1271,0,3640,5720],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [135,1272,0,26618,41828],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [136,1273,0,1831,2880],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(7,301,120)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 301,
    level = 120,
    props_1 = [141,1371,0,3640,5720,8008],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [135,1372,0,26618,41828,58559],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [136,1373,0,1831,2880,4030],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(7,301,140)->
    #equipRecastAdvanceCfg {
    slot = 7,
    career = 301,
    level = 140,
    props_1 = [141,1471,0,3640,5720,8008,10400],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [135,1472,0,26618,41828,58559,76051],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [136,1473,0,1831,2880,4030,5230],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(8,101,58)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 101,
    level = 58,
    props_1 = [146,1181,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1182,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1183,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(8,101,90)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 101,
    level = 90,
    props_1 = [146,1281,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [139,1282,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1283,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(8,101,120)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 101,
    level = 120,
    props_1 = [146,1381,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [139,1382,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1383,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(8,101,140)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 101,
    level = 140,
    props_1 = [146,1481,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [139,1482,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1483,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(8,201,58)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 201,
    level = 58,
    props_1 = [146,1181,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1182,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1183,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(8,201,90)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 201,
    level = 90,
    props_1 = [146,1281,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [139,1282,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1283,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(8,201,120)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 201,
    level = 120,
    props_1 = [146,1381,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [139,1382,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1383,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(8,201,140)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 201,
    level = 140,
    props_1 = [146,1481,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [139,1482,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1483,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(8,301,58)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 301,
    level = 58,
    props_1 = [146,1181,0,4853],
    displaymode_1 = 0,
    cost_1 = [{241,1}],
    props_2 = [139,1182,0,5308],
    displaymode_2 = 0,
    cost_2 = [{241,1}],
    props_3 = [135,1183,0,27471],
    displaymode_3 = 0,
    cost_3 = [{241,1}]
    };
getRow(8,301,90)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 301,
    level = 90,
    props_1 = [146,1281,0,4853,7626],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2}],
    props_2 = [139,1282,0,5308,8341],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2}],
    props_3 = [135,1283,0,27471,43170],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2}]
    };
getRow(8,301,120)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 301,
    level = 120,
    props_1 = [146,1381,0,4853,7626,10676],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3}],
    props_2 = [139,1382,0,5308,8341,11677],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3}],
    props_3 = [135,1383,0,27471,43170,60440],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3}]
    };
getRow(8,301,140)->
    #equipRecastAdvanceCfg {
    slot = 8,
    career = 301,
    level = 140,
    props_1 = [146,1481,0,4853,7626,10676,13865],
    displaymode_1 = 0,
    cost_1 = [{241,1},{241,2},{241,3},{241,4}],
    props_2 = [139,1482,0,5308,8341,11677,15165],
    displaymode_2 = 0,
    cost_2 = [{241,1},{241,2},{241,3},{241,4}],
    props_3 = [135,1483,0,27471,43170,60440,78490],
    displaymode_3 = 0,
    cost_3 = [{241,1},{241,2},{241,3},{241,4}]
    };
getRow(_,_,_)->[].

getKeyList()->[
    {1,101,58},
    {1,101,90},
    {1,101,120},
    {1,101,140},
    {1,201,58},
    {1,201,90},
    {1,201,120},
    {1,201,140},
    {1,301,58},
    {1,301,90},
    {1,301,120},
    {1,301,140},
    {2,101,58},
    {2,101,90},
    {2,101,120},
    {2,101,140},
    {2,201,58},
    {2,201,90},
    {2,201,120},
    {2,201,140},
    {2,301,58},
    {2,301,90},
    {2,301,120},
    {2,301,140},
    {3,101,58},
    {3,101,90},
    {3,101,120},
    {3,101,140},
    {3,201,58},
    {3,201,90},
    {3,201,120},
    {3,201,140},
    {3,301,58},
    {3,301,90},
    {3,301,120},
    {3,301,140},
    {4,101,58},
    {4,101,90},
    {4,101,120},
    {4,101,140},
    {4,201,58},
    {4,201,90},
    {4,201,120},
    {4,201,140},
    {4,301,58},
    {4,301,90},
    {4,301,120},
    {4,301,140},
    {5,101,58},
    {5,101,90},
    {5,101,120},
    {5,101,140},
    {5,201,58},
    {5,201,90},
    {5,201,120},
    {5,201,140},
    {5,301,58},
    {5,301,90},
    {5,301,120},
    {5,301,140},
    {6,101,58},
    {6,101,90},
    {6,101,120},
    {6,101,140},
    {6,201,58},
    {6,201,90},
    {6,201,120},
    {6,201,140},
    {6,301,58},
    {6,301,90},
    {6,301,120},
    {6,301,140},
    {7,101,58},
    {7,101,90},
    {7,101,120},
    {7,101,140},
    {7,201,58},
    {7,201,90},
    {7,201,120},
    {7,201,140},
    {7,301,58},
    {7,301,90},
    {7,301,120},
    {7,301,140},
    {8,101,58},
    {8,101,90},
    {8,101,120},
    {8,101,140},
    {8,201,58},
    {8,201,90},
    {8,201,120},
    {8,201,140},
    {8,301,58},
    {8,301,90},
    {8,301,120},
    {8,301,140}
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
    {101, 58},
    {101, 90},
    {101, 120},
    {101, 140},
    {201, 58},
    {201, 90},
    {201, 120},
    {201, 140},
    {301, 58},
    {301, 90},
    {301, 120},
    {301, 140}
    ];
get2KeyList(2)->[
    {101, 58},
    {101, 90},
    {101, 120},
    {101, 140},
    {201, 58},
    {201, 90},
    {201, 120},
    {201, 140},
    {301, 58},
    {301, 90},
    {301, 120},
    {301, 140}
    ];
get2KeyList(3)->[
    {101, 58},
    {101, 90},
    {101, 120},
    {101, 140},
    {201, 58},
    {201, 90},
    {201, 120},
    {201, 140},
    {301, 58},
    {301, 90},
    {301, 120},
    {301, 140}
    ];
get2KeyList(4)->[
    {101, 58},
    {101, 90},
    {101, 120},
    {101, 140},
    {201, 58},
    {201, 90},
    {201, 120},
    {201, 140},
    {301, 58},
    {301, 90},
    {301, 120},
    {301, 140}
    ];
get2KeyList(5)->[
    {101, 58},
    {101, 90},
    {101, 120},
    {101, 140},
    {201, 58},
    {201, 90},
    {201, 120},
    {201, 140},
    {301, 58},
    {301, 90},
    {301, 120},
    {301, 140}
    ];
get2KeyList(6)->[
    {101, 58},
    {101, 90},
    {101, 120},
    {101, 140},
    {201, 58},
    {201, 90},
    {201, 120},
    {201, 140},
    {301, 58},
    {301, 90},
    {301, 120},
    {301, 140}
    ];
get2KeyList(7)->[
    {101, 58},
    {101, 90},
    {101, 120},
    {101, 140},
    {201, 58},
    {201, 90},
    {201, 120},
    {201, 140},
    {301, 58},
    {301, 90},
    {301, 120},
    {301, 140}
    ];
get2KeyList(8)->[
    {101, 58},
    {101, 90},
    {101, 120},
    {101, 140},
    {201, 58},
    {201, 90},
    {201, 120},
    {201, 140},
    {301, 58},
    {301, 90},
    {301, 120},
    {301, 140}
    ];
get2KeyList(_)->[].

get3KeyList(1,101)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(1,201)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(1,301)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(2,101)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(2,201)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(2,301)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(3,101)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(3,201)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(3,301)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(4,101)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(4,201)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(4,301)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(5,101)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(5,201)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(5,301)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(6,101)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(6,201)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(6,301)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(7,101)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(7,201)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(7,301)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(8,101)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(8,201)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(8,301)->[
    58,
    90,
    120,
    140
    ];
get3KeyList(_,_)->[].

