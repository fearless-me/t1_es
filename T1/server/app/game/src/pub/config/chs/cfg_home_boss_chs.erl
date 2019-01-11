%% coding: latin-1
%%: 实现
-module(cfg_home_boss_chs).
-compile(export_all).
-include("cfg_home_boss.hrl").
-include("logger.hrl").

getRow(2)->
    #home_bossCfg {
    homelevel = 2,
    monsterid = 1402,
    mapid = 10002,
    reward1 = [{26293,1}],
    reward2 = [{26281,1}],
    reward3 = [{26269,1}],
    reward4 = [{26257,1}],
    assist1 = [{26299,1}],
    assist2 = [{26287,1}],
    assist3 = [{26275,1}],
    assist4 = [{26263,1}],
    showreward = [26305,26306,14184,14185 ]
    };
getRow(3)->
    #home_bossCfg {
    homelevel = 3,
    monsterid = 1403,
    mapid = 10003,
    reward1 = [{26294,1}],
    reward2 = [{26282,1}],
    reward3 = [{26270,1}],
    reward4 = [{26258,1}],
    assist1 = [{26300,1}],
    assist2 = [{26288,1}],
    assist3 = [{26276,1}],
    assist4 = [{26264,1}],
    showreward = [26307,26308,14184,14185 ]
    };
getRow(4)->
    #home_bossCfg {
    homelevel = 4,
    monsterid = 1404,
    mapid = 10004,
    reward1 = [{26295,1}],
    reward2 = [{26283,1}],
    reward3 = [{26271,1}],
    reward4 = [{26259,1}],
    assist1 = [{26301,1}],
    assist2 = [{26289,1}],
    assist3 = [{26277,1}],
    assist4 = [{26265,1}],
    showreward = [26309,26310,14184,14185 ]
    };
getRow(5)->
    #home_bossCfg {
    homelevel = 5,
    monsterid = 1405,
    mapid = 10005,
    reward1 = [{26296,1}],
    reward2 = [{26284,1}],
    reward3 = [{26272,1}],
    reward4 = [{26260,1}],
    assist1 = [{26302,1}],
    assist2 = [{26290,1}],
    assist3 = [{26278,1}],
    assist4 = [{26266,1}],
    showreward = [26311,26312,14184,14185 ]
    };
getRow(6)->
    #home_bossCfg {
    homelevel = 6,
    monsterid = 1406,
    mapid = 10006,
    reward1 = [{26297,1}],
    reward2 = [{26285,1}],
    reward3 = [{26273,1}],
    reward4 = [{26261,1}],
    assist1 = [{26303,1}],
    assist2 = [{26291,1}],
    assist3 = [{26279,1}],
    assist4 = [{26267,1}],
    showreward = [26313,26314,14184,14185 ]
    };
getRow(7)->
    #home_bossCfg {
    homelevel = 7,
    monsterid = 1407,
    mapid = 10007,
    reward1 = [{26298,1}],
    reward2 = [{26286,1}],
    reward3 = [{26274,1}],
    reward4 = [{26262,1}],
    assist1 = [{26304,1}],
    assist2 = [{26292,1}],
    assist3 = [{26280,1}],
    assist4 = [{26268,1}],
    showreward = [26315,26316,14184,14185 ]
    };
getRow(_)->[].

getKeyList()->[
    {2},
    {3},
    {4},
    {5},
    {6},
    {7}
    ].

get1KeyList()->[
    2,
    3,
    4,
    5,
    6,
    7
    ].

