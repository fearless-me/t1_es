%% coding: latin-1
%%: 实现
-module(cfg_task_other_chs).
-compile(export_all).
-include("cfg_task_other.hrl").
-include("logger.hrl").

getRow(1,3)->
    #task_otherCfg {
    type = 1,
    id = 3,
    level = 46,
    loop = 1,
    taskid = [10007]
    };
getRow(1,5)->
    #task_otherCfg {
    type = 1,
    id = 5,
    level = 66,
    loop = 0,
    taskid = [10008]
    };
getRow(1,6)->
    #task_otherCfg {
    type = 1,
    id = 6,
    level = 30,
    loop = 0,
    taskid = [10015]
    };
getRow(1,8)->
    #task_otherCfg {
    type = 1,
    id = 8,
    level = 80,
    loop = 1,
    taskid = [10006]
    };
getRow(1,19)->
    #task_otherCfg {
    type = 1,
    id = 19,
    level = 28,
    loop = 0,
    taskid = [10009]
    };
getRow(1,22)->
    #task_otherCfg {
    type = 1,
    id = 22,
    level = 30,
    loop = 0,
    taskid = [10016]
    };
getRow(2,27)->
    #task_otherCfg {
    type = 2,
    id = 27,
    level = 27,
    loop = 0,
    taskid = [10014]
    };
getRow(2,36)->
    #task_otherCfg {
    type = 2,
    id = 36,
    level = 36,
    loop = 0,
    taskid = [10003]
    };
getRow(2,37)->
    #task_otherCfg {
    type = 2,
    id = 37,
    level = 37,
    loop = 0,
    taskid = [10011]
    };
getRow(2,38)->
    #task_otherCfg {
    type = 2,
    id = 38,
    level = 38,
    loop = 0,
    taskid = [10001]
    };
getRow(2,40)->
    #task_otherCfg {
    type = 2,
    id = 40,
    level = 40,
    loop = 0,
    taskid = [10002]
    };
getRow(2,41)->
    #task_otherCfg {
    type = 2,
    id = 41,
    level = 41,
    loop = 0,
    taskid = [10017]
    };
getRow(2,43)->
    #task_otherCfg {
    type = 2,
    id = 43,
    level = 43,
    loop = 0,
    taskid = [10012]
    };
getRow(2,54)->
    #task_otherCfg {
    type = 2,
    id = 54,
    level = 54,
    loop = 0,
    taskid = [12001]
    };
getRow(2,70)->
    #task_otherCfg {
    type = 2,
    id = 70,
    level = 70,
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
    {2,27},
    {2,36},
    {2,37},
    {2,38},
    {2,40},
    {2,41},
    {2,43},
    {2,54},
    {2,70}
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
    27,
    36,
    37,
    38,
    40,
    41,
    43,
    54,
    70
    ];
get2KeyList(_)->[].

