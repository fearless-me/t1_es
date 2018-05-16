%% coding: latin-1
%%: 实现
-module(cfg_task_other_cht).
-compile(export_all).
-include("cfg_task_other.hrl").
-include("logger.hrl").

getRow(1,3)->
    #task_otherCfg {
    type = 1,
    id = 3,
    level = 23,
    loop = 1,
    taskid = [10007]
    };
getRow(1,5)->
    #task_otherCfg {
    type = 1,
    id = 5,
    level = 33,
    loop = 0,
    taskid = [10008]
    };
getRow(1,6)->
    #task_otherCfg {
    type = 1,
    id = 6,
    level = 15,
    loop = 0,
    taskid = [10015]
    };
getRow(1,8)->
    #task_otherCfg {
    type = 1,
    id = 8,
    level = 40,
    loop = 1,
    taskid = [10006]
    };
getRow(1,19)->
    #task_otherCfg {
    type = 1,
    id = 19,
    level = 14,
    loop = 0,
    taskid = [10009]
    };
getRow(1,22)->
    #task_otherCfg {
    type = 1,
    id = 22,
    level = 15,
    loop = 0,
    taskid = [10016]
    };
getRow(2,11)->
    #task_otherCfg {
    type = 2,
    id = 11,
    level = 11,
    loop = 0,
    taskid = [10001]
    };
getRow(2,12)->
    #task_otherCfg {
    type = 2,
    id = 12,
    level = 12,
    loop = 0,
    taskid = [12000]
    };
getRow(2,15)->
    #task_otherCfg {
    type = 2,
    id = 15,
    level = 15,
    loop = 0,
    taskid = [10003]
    };
getRow(2,17)->
    #task_otherCfg {
    type = 2,
    id = 17,
    level = 17,
    loop = 0,
    taskid = [10014]
    };
getRow(2,18)->
    #task_otherCfg {
    type = 2,
    id = 18,
    level = 18,
    loop = 0,
    taskid = [10011]
    };
getRow(2,20)->
    #task_otherCfg {
    type = 2,
    id = 20,
    level = 20,
    loop = 0,
    taskid = [10002]
    };
getRow(2,22)->
    #task_otherCfg {
    type = 2,
    id = 22,
    level = 22,
    loop = 0,
    taskid = [10012]
    };
getRow(2,27)->
    #task_otherCfg {
    type = 2,
    id = 27,
    level = 27,
    loop = 0,
    taskid = [12001]
    };
getRow(2,35)->
    #task_otherCfg {
    type = 2,
    id = 35,
    level = 35,
    loop = 0,
    taskid = [10005]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,3},
    {1,5},
    {1,6},
    {1,8},
    {1,19},
    {1,22},
    {2,11},
    {2,12},
    {2,15},
    {2,17},
    {2,18},
    {2,20},
    {2,22},
    {2,27},
    {2,35}
    ].

get1KeyList()->[
    1,
    2
    ].

get2KeyList(1)->[
    3,
    5,
    6,
    8,
    19,
    22
    ];
get2KeyList(2)->[
    11,
    12,
    15,
    17,
    18,
    20,
    22,
    27,
    35
    ];
get2KeyList(_)->[].

