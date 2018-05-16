%% coding: latin-1
%%: 实现
-module(cfg_petreborn_cht).
-compile(export_all).
-include("cfg_petreborn.hrl").
-include("logger.hrl").

getRow(1,0)->
    #petrebornCfg {
    groupid = 1,
    lv = 0,
    star_up = 0,
    reborn = 0,
    star = 0,
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 1
    };
getRow(1,1)->
    #petrebornCfg {
    groupid = 1,
    lv = 1,
    star_up = 0,
    reborn = 0.042,
    star = 0.098,
    item_star = [{2160,5}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 1
    };
getRow(1,2)->
    #petrebornCfg {
    groupid = 1,
    lv = 2,
    star_up = 0,
    reborn = 0.106,
    star = 0.195,
    item_star = [{2160,8}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 1
    };
getRow(1,3)->
    #petrebornCfg {
    groupid = 1,
    lv = 3,
    star_up = 0,
    reborn = 0.211,
    star = 0.293,
    item_star = [{2160,11}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 1
    };
getRow(1,4)->
    #petrebornCfg {
    groupid = 1,
    lv = 4,
    star_up = 0,
    reborn = 0.358,
    star = 0.39,
    item_star = [{2160,14}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 20
    };
getRow(1,5)->
    #petrebornCfg {
    groupid = 1,
    lv = 5,
    star_up = 1,
    reborn = 0.547,
    star = 0.683,
    item_star = [{11000,3}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 20
    };
getRow(1,6)->
    #petrebornCfg {
    groupid = 1,
    lv = 6,
    star_up = 0,
    reborn = 0.778,
    star = 0.793,
    item_star = [{2160,22}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 30
    };
getRow(1,7)->
    #petrebornCfg {
    groupid = 1,
    lv = 7,
    star_up = 0,
    reborn = 1.051,
    star = 0.904,
    item_star = [{2160,26}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 40
    };
getRow(1,8)->
    #petrebornCfg {
    groupid = 1,
    lv = 8,
    star_up = 0,
    reborn = 1.365,
    star = 1.014,
    item_star = [{2160,30}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 50
    };
getRow(1,9)->
    #petrebornCfg {
    groupid = 1,
    lv = 9,
    star_up = 0,
    reborn = 1.722,
    star = 1.125,
    item_star = [{2160,34}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 60
    };
getRow(1,10)->
    #petrebornCfg {
    groupid = 1,
    lv = 10,
    star_up = 1,
    reborn = 2.12,
    star = 1.755,
    item_star = [{11000,5}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 70
    };
getRow(1,11)->
    #petrebornCfg {
    groupid = 1,
    lv = 11,
    star_up = 0,
    reborn = 0,
    star = 1.885,
    item_star = [{2160,44}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 0
    };
getRow(1,12)->
    #petrebornCfg {
    groupid = 1,
    lv = 12,
    star_up = 0,
    reborn = 0,
    star = 2.015,
    item_star = [{2160,49}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 0
    };
getRow(1,13)->
    #petrebornCfg {
    groupid = 1,
    lv = 13,
    star_up = 0,
    reborn = 0,
    star = 2.145,
    item_star = [{2160,54}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 0
    };
getRow(1,14)->
    #petrebornCfg {
    groupid = 1,
    lv = 14,
    star_up = 0,
    reborn = 0,
    star = 2.275,
    item_star = [{2160,59}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 0
    };
getRow(1,15)->
    #petrebornCfg {
    groupid = 1,
    lv = 15,
    star_up = 1,
    reborn = 0,
    star = 3.055,
    item_star = [{11000,7}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 0
    };
getRow(1,16)->
    #petrebornCfg {
    groupid = 1,
    lv = 16,
    star_up = 0,
    reborn = 0,
    star = 3.205,
    item_star = [{2160,71}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 0
    };
getRow(1,17)->
    #petrebornCfg {
    groupid = 1,
    lv = 17,
    star_up = 0,
    reborn = 0,
    star = 3.354,
    item_star = [{2160,77}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 0
    };
getRow(1,18)->
    #petrebornCfg {
    groupid = 1,
    lv = 18,
    star_up = 0,
    reborn = 0,
    star = 3.504,
    item_star = [{2160,83}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 0
    };
getRow(1,19)->
    #petrebornCfg {
    groupid = 1,
    lv = 19,
    star_up = 0,
    reborn = 0,
    star = 3.653,
    item_star = [{2160,89}],
    quanlity = 1.1,
    limit_star = 1,
    limit_reborn = 0
    };
getRow(1,20)->
    #petrebornCfg {
    groupid = 1,
    lv = 20,
    star_up = 1,
    reborn = 0,
    star = 4.583,
    item_star = [{11000,9}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,21)->
    #petrebornCfg {
    groupid = 1,
    lv = 21,
    star_up = 0,
    reborn = 0,
    star = 4.745,
    item_star = [{2160,105}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,22)->
    #petrebornCfg {
    groupid = 1,
    lv = 22,
    star_up = 0,
    reborn = 0,
    star = 4.908,
    item_star = [{2160,113}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,23)->
    #petrebornCfg {
    groupid = 1,
    lv = 23,
    star_up = 0,
    reborn = 0,
    star = 5.07,
    item_star = [{2160,121}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,24)->
    #petrebornCfg {
    groupid = 1,
    lv = 24,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2160,129}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,25)->
    #petrebornCfg {
    groupid = 1,
    lv = 25,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11000,12}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,26)->
    #petrebornCfg {
    groupid = 1,
    lv = 26,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2160,149}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,27)->
    #petrebornCfg {
    groupid = 1,
    lv = 27,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2160,159}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,28)->
    #petrebornCfg {
    groupid = 1,
    lv = 28,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2160,169}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,29)->
    #petrebornCfg {
    groupid = 1,
    lv = 29,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2160,179}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,30)->
    #petrebornCfg {
    groupid = 1,
    lv = 30,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11000,15}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,31)->
    #petrebornCfg {
    groupid = 1,
    lv = 31,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2160,203}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,32)->
    #petrebornCfg {
    groupid = 1,
    lv = 32,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2160,215}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,33)->
    #petrebornCfg {
    groupid = 1,
    lv = 33,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2160,227}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,34)->
    #petrebornCfg {
    groupid = 1,
    lv = 34,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2160,239}],
    quanlity = 1.1,
    limit_star = 10,
    limit_reborn = 0
    };
getRow(1,35)->
    #petrebornCfg {
    groupid = 1,
    lv = 35,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11001,6}],
    quanlity = 1.1,
    limit_star = 15,
    limit_reborn = 0
    };
getRow(1,36)->
    #petrebornCfg {
    groupid = 1,
    lv = 36,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,89}],
    quanlity = 1.1,
    limit_star = 15,
    limit_reborn = 0
    };
getRow(1,37)->
    #petrebornCfg {
    groupid = 1,
    lv = 37,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,93}],
    quanlity = 1.1,
    limit_star = 15,
    limit_reborn = 0
    };
getRow(1,38)->
    #petrebornCfg {
    groupid = 1,
    lv = 38,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,98}],
    quanlity = 1.1,
    limit_star = 15,
    limit_reborn = 0
    };
getRow(1,39)->
    #petrebornCfg {
    groupid = 1,
    lv = 39,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,103}],
    quanlity = 1.1,
    limit_star = 15,
    limit_reborn = 0
    };
getRow(1,40)->
    #petrebornCfg {
    groupid = 1,
    lv = 40,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11001,8}],
    quanlity = 1.1,
    limit_star = 15,
    limit_reborn = 0
    };
getRow(1,41)->
    #petrebornCfg {
    groupid = 1,
    lv = 41,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,113}],
    quanlity = 1.1,
    limit_star = 15,
    limit_reborn = 0
    };
getRow(1,42)->
    #petrebornCfg {
    groupid = 1,
    lv = 42,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,119}],
    quanlity = 1.1,
    limit_star = 15,
    limit_reborn = 0
    };
getRow(1,43)->
    #petrebornCfg {
    groupid = 1,
    lv = 43,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,124}],
    quanlity = 1.1,
    limit_star = 15,
    limit_reborn = 0
    };
getRow(1,44)->
    #petrebornCfg {
    groupid = 1,
    lv = 44,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,129}],
    quanlity = 1.1,
    limit_star = 15,
    limit_reborn = 0
    };
getRow(1,45)->
    #petrebornCfg {
    groupid = 1,
    lv = 45,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11001,10}],
    quanlity = 1.1,
    limit_star = 20,
    limit_reborn = 0
    };
getRow(1,46)->
    #petrebornCfg {
    groupid = 1,
    lv = 46,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,143}],
    quanlity = 1.1,
    limit_star = 20,
    limit_reborn = 0
    };
getRow(1,47)->
    #petrebornCfg {
    groupid = 1,
    lv = 47,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,149}],
    quanlity = 1.1,
    limit_star = 20,
    limit_reborn = 0
    };
getRow(1,48)->
    #petrebornCfg {
    groupid = 1,
    lv = 48,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,156}],
    quanlity = 1.1,
    limit_star = 20,
    limit_reborn = 0
    };
getRow(1,49)->
    #petrebornCfg {
    groupid = 1,
    lv = 49,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,163}],
    quanlity = 1.1,
    limit_star = 20,
    limit_reborn = 0
    };
getRow(1,50)->
    #petrebornCfg {
    groupid = 1,
    lv = 50,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11001,12}],
    quanlity = 1.1,
    limit_star = 20,
    limit_reborn = 0
    };
getRow(1,51)->
    #petrebornCfg {
    groupid = 1,
    lv = 51,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,179}],
    quanlity = 1.1,
    limit_star = 20,
    limit_reborn = 0
    };
getRow(1,52)->
    #petrebornCfg {
    groupid = 1,
    lv = 52,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,188}],
    quanlity = 1.1,
    limit_star = 20,
    limit_reborn = 0
    };
getRow(1,53)->
    #petrebornCfg {
    groupid = 1,
    lv = 53,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,196}],
    quanlity = 1.1,
    limit_star = 20,
    limit_reborn = 0
    };
getRow(1,54)->
    #petrebornCfg {
    groupid = 1,
    lv = 54,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,204}],
    quanlity = 1.1,
    limit_star = 20,
    limit_reborn = 0
    };
getRow(1,55)->
    #petrebornCfg {
    groupid = 1,
    lv = 55,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11001,14}],
    quanlity = 1.1,
    limit_star = 25,
    limit_reborn = 0
    };
getRow(1,56)->
    #petrebornCfg {
    groupid = 1,
    lv = 56,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,224}],
    quanlity = 1.1,
    limit_star = 25,
    limit_reborn = 0
    };
getRow(1,57)->
    #petrebornCfg {
    groupid = 1,
    lv = 57,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,234}],
    quanlity = 1.1,
    limit_star = 25,
    limit_reborn = 0
    };
getRow(1,58)->
    #petrebornCfg {
    groupid = 1,
    lv = 58,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,244}],
    quanlity = 1.1,
    limit_star = 25,
    limit_reborn = 0
    };
getRow(1,59)->
    #petrebornCfg {
    groupid = 1,
    lv = 59,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,254}],
    quanlity = 1.1,
    limit_star = 25,
    limit_reborn = 0
    };
getRow(1,60)->
    #petrebornCfg {
    groupid = 1,
    lv = 60,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11001,16}],
    quanlity = 1.1,
    limit_star = 25,
    limit_reborn = 0
    };
getRow(1,61)->
    #petrebornCfg {
    groupid = 1,
    lv = 61,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,278}],
    quanlity = 1.1,
    limit_star = 25,
    limit_reborn = 0
    };
getRow(1,62)->
    #petrebornCfg {
    groupid = 1,
    lv = 62,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,289}],
    quanlity = 1.1,
    limit_star = 25,
    limit_reborn = 0
    };
getRow(1,63)->
    #petrebornCfg {
    groupid = 1,
    lv = 63,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,301}],
    quanlity = 1.1,
    limit_star = 25,
    limit_reborn = 0
    };
getRow(1,64)->
    #petrebornCfg {
    groupid = 1,
    lv = 64,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,313}],
    quanlity = 1.1,
    limit_star = 25,
    limit_reborn = 0
    };
getRow(1,65)->
    #petrebornCfg {
    groupid = 1,
    lv = 65,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11002,6}],
    quanlity = 1.1,
    limit_star = 30,
    limit_reborn = 0
    };
getRow(1,66)->
    #petrebornCfg {
    groupid = 1,
    lv = 66,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,113}],
    quanlity = 1.1,
    limit_star = 30,
    limit_reborn = 0
    };
getRow(1,67)->
    #petrebornCfg {
    groupid = 1,
    lv = 67,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,117}],
    quanlity = 1.1,
    limit_star = 30,
    limit_reborn = 0
    };
getRow(1,68)->
    #petrebornCfg {
    groupid = 1,
    lv = 68,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,122}],
    quanlity = 1.1,
    limit_star = 30,
    limit_reborn = 0
    };
getRow(1,69)->
    #petrebornCfg {
    groupid = 1,
    lv = 69,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,126}],
    quanlity = 1.1,
    limit_star = 30,
    limit_reborn = 0
    };
getRow(1,70)->
    #petrebornCfg {
    groupid = 1,
    lv = 70,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11002,8}],
    quanlity = 1.1,
    limit_star = 30,
    limit_reborn = 0
    };
getRow(1,71)->
    #petrebornCfg {
    groupid = 1,
    lv = 71,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,137}],
    quanlity = 1.1,
    limit_star = 30,
    limit_reborn = 0
    };
getRow(1,72)->
    #petrebornCfg {
    groupid = 1,
    lv = 72,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,143}],
    quanlity = 1.1,
    limit_star = 30,
    limit_reborn = 0
    };
getRow(1,73)->
    #petrebornCfg {
    groupid = 1,
    lv = 73,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,148}],
    quanlity = 1.1,
    limit_star = 30,
    limit_reborn = 0
    };
getRow(1,74)->
    #petrebornCfg {
    groupid = 1,
    lv = 74,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,154}],
    quanlity = 1.1,
    limit_star = 30,
    limit_reborn = 0
    };
getRow(1,75)->
    #petrebornCfg {
    groupid = 1,
    lv = 75,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11002,10}],
    quanlity = 1.1,
    limit_star = 35,
    limit_reborn = 0
    };
getRow(1,76)->
    #petrebornCfg {
    groupid = 1,
    lv = 76,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,167}],
    quanlity = 1.1,
    limit_star = 35,
    limit_reborn = 0
    };
getRow(1,77)->
    #petrebornCfg {
    groupid = 1,
    lv = 77,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,174}],
    quanlity = 1.1,
    limit_star = 35,
    limit_reborn = 0
    };
getRow(1,78)->
    #petrebornCfg {
    groupid = 1,
    lv = 78,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,181}],
    quanlity = 1.1,
    limit_star = 35,
    limit_reborn = 0
    };
getRow(1,79)->
    #petrebornCfg {
    groupid = 1,
    lv = 79,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,187}],
    quanlity = 1.1,
    limit_star = 35,
    limit_reborn = 0
    };
getRow(1,80)->
    #petrebornCfg {
    groupid = 1,
    lv = 80,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11002,12}],
    quanlity = 1.1,
    limit_star = 35,
    limit_reborn = 0
    };
getRow(1,81)->
    #petrebornCfg {
    groupid = 1,
    lv = 81,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,203}],
    quanlity = 1.1,
    limit_star = 35,
    limit_reborn = 0
    };
getRow(1,82)->
    #petrebornCfg {
    groupid = 1,
    lv = 82,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,211}],
    quanlity = 1.1,
    limit_star = 35,
    limit_reborn = 0
    };
getRow(1,83)->
    #petrebornCfg {
    groupid = 1,
    lv = 83,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,218}],
    quanlity = 1.1,
    limit_star = 35,
    limit_reborn = 0
    };
getRow(1,84)->
    #petrebornCfg {
    groupid = 1,
    lv = 84,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,226}],
    quanlity = 1.1,
    limit_star = 35,
    limit_reborn = 0
    };
getRow(1,85)->
    #petrebornCfg {
    groupid = 1,
    lv = 85,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11002,14}],
    quanlity = 1.1,
    limit_star = 40,
    limit_reborn = 0
    };
getRow(1,86)->
    #petrebornCfg {
    groupid = 1,
    lv = 86,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,244}],
    quanlity = 1.1,
    limit_star = 40,
    limit_reborn = 0
    };
getRow(1,87)->
    #petrebornCfg {
    groupid = 1,
    lv = 87,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,253}],
    quanlity = 1.1,
    limit_star = 40,
    limit_reborn = 0
    };
getRow(1,88)->
    #petrebornCfg {
    groupid = 1,
    lv = 88,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,262}],
    quanlity = 1.1,
    limit_star = 40,
    limit_reborn = 0
    };
getRow(1,89)->
    #petrebornCfg {
    groupid = 1,
    lv = 89,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,271}],
    quanlity = 1.1,
    limit_star = 40,
    limit_reborn = 0
    };
getRow(1,90)->
    #petrebornCfg {
    groupid = 1,
    lv = 90,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11002,16}],
    quanlity = 1.1,
    limit_star = 40,
    limit_reborn = 0
    };
getRow(1,91)->
    #petrebornCfg {
    groupid = 1,
    lv = 91,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,291}],
    quanlity = 1.1,
    limit_star = 40,
    limit_reborn = 0
    };
getRow(1,92)->
    #petrebornCfg {
    groupid = 1,
    lv = 92,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,301}],
    quanlity = 1.1,
    limit_star = 40,
    limit_reborn = 0
    };
getRow(1,93)->
    #petrebornCfg {
    groupid = 1,
    lv = 93,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,311}],
    quanlity = 1.1,
    limit_star = 40,
    limit_reborn = 0
    };
getRow(1,94)->
    #petrebornCfg {
    groupid = 1,
    lv = 94,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,321}],
    quanlity = 1.1,
    limit_star = 40,
    limit_reborn = 0
    };
getRow(1,95)->
    #petrebornCfg {
    groupid = 1,
    lv = 95,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11002,18}],
    quanlity = 1.1,
    limit_star = 45,
    limit_reborn = 0
    };
getRow(1,96)->
    #petrebornCfg {
    groupid = 1,
    lv = 96,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,343}],
    quanlity = 1.1,
    limit_star = 45,
    limit_reborn = 0
    };
getRow(1,97)->
    #petrebornCfg {
    groupid = 1,
    lv = 97,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,354}],
    quanlity = 1.1,
    limit_star = 45,
    limit_reborn = 0
    };
getRow(1,98)->
    #petrebornCfg {
    groupid = 1,
    lv = 98,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,365}],
    quanlity = 1.1,
    limit_star = 45,
    limit_reborn = 0
    };
getRow(1,99)->
    #petrebornCfg {
    groupid = 1,
    lv = 99,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,376}],
    quanlity = 1.1,
    limit_star = 45,
    limit_reborn = 0
    };
getRow(1,100)->
    #petrebornCfg {
    groupid = 1,
    lv = 100,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{11002,20}],
    quanlity = 1.1,
    limit_star = 45,
    limit_reborn = 0
    };
getRow(1,101)->
    #petrebornCfg {
    groupid = 1,
    lv = 101,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,72}],
    quanlity = 1.1,
    limit_star = 45,
    limit_reborn = 0
    };
getRow(1,102)->
    #petrebornCfg {
    groupid = 1,
    lv = 102,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,74}],
    quanlity = 1.1,
    limit_star = 45,
    limit_reborn = 0
    };
getRow(1,103)->
    #petrebornCfg {
    groupid = 1,
    lv = 103,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,76}],
    quanlity = 1.1,
    limit_star = 45,
    limit_reborn = 0
    };
getRow(1,104)->
    #petrebornCfg {
    groupid = 1,
    lv = 104,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2162,77}],
    quanlity = 1.1,
    limit_star = 45,
    limit_reborn = 0
    };
getRow(_,_)->[].

getKeyList()->[
    {1,0},
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {1,8},
    {1,9},
    {1,10},
    {1,11},
    {1,12},
    {1,13},
    {1,14},
    {1,15},
    {1,16},
    {1,17},
    {1,18},
    {1,19},
    {1,20},
    {1,21},
    {1,22},
    {1,23},
    {1,24},
    {1,25},
    {1,26},
    {1,27},
    {1,28},
    {1,29},
    {1,30},
    {1,31},
    {1,32},
    {1,33},
    {1,34},
    {1,35},
    {1,36},
    {1,37},
    {1,38},
    {1,39},
    {1,40},
    {1,41},
    {1,42},
    {1,43},
    {1,44},
    {1,45},
    {1,46},
    {1,47},
    {1,48},
    {1,49},
    {1,50},
    {1,51},
    {1,52},
    {1,53},
    {1,54},
    {1,55},
    {1,56},
    {1,57},
    {1,58},
    {1,59},
    {1,60},
    {1,61},
    {1,62},
    {1,63},
    {1,64},
    {1,65},
    {1,66},
    {1,67},
    {1,68},
    {1,69},
    {1,70},
    {1,71},
    {1,72},
    {1,73},
    {1,74},
    {1,75},
    {1,76},
    {1,77},
    {1,78},
    {1,79},
    {1,80},
    {1,81},
    {1,82},
    {1,83},
    {1,84},
    {1,85},
    {1,86},
    {1,87},
    {1,88},
    {1,89},
    {1,90},
    {1,91},
    {1,92},
    {1,93},
    {1,94},
    {1,95},
    {1,96},
    {1,97},
    {1,98},
    {1,99},
    {1,100},
    {1,101},
    {1,102},
    {1,103},
    {1,104}
    ].

get1KeyList()->[
    1
    ].

get2KeyList(1)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104
    ];
get2KeyList(_)->[].

