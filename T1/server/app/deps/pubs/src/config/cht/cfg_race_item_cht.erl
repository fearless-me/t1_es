%% coding: latin-1
%%: 实现
-module(cfg_race_item_cht).
-compile(export_all).
-include("cfg_race_item.hrl").
-include("logger.hrl").

getRow(1)->
    #race_itemCfg {
    id = 1,
    type = 2,
    param1 = [63000,63001],
    param2 = [15,30],
    rand = [1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0],
    name = "冰冻",
    icon = 1006,
    text = "冰冻周围的敌人",
    cast_vfx = ["other/vfx_26_71","other/vfx_26_72"]
    };
getRow(2)->
    #race_itemCfg {
    id = 2,
    type = 1,
    param1 = [63002,63003],
    rand = [500,500,500,1000,1000,1000,1000,200,200,200,200,200,200,200],
    name = "无敌",
    icon = 250,
    text = "自身获得无敌"
    };
getRow(3)->
    #race_itemCfg {
    id = 3,
    type = 3,
    param1 = [63004,63005],
    rand = [0,400,400,400,600,800,1000,1000,1000,1000,800,600,400,400],
    name = "闪电",
    icon = 211,
    text = "对第一名冒险者施法减速闪电",
    cast_vfx = ["other/vfx_26_79"]
    };
getRow(4)->
    #race_itemCfg {
    id = 4,
    type = 5,
    param1 = [16000,16001],
    param2 = [3.14,15,0],
    rand = [1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0],
    name = "烟幕",
    icon = 231,
    text = "往身后丢出一片烟雾"
    };
getRow(5)->
    #race_itemCfg {
    id = 5,
    type = 2,
    param1 = [63008,63009],
    param2 = [2000,2000],
    rand = [300,300,300,300,300,300,300,300,300,300,300,300,300,300],
    name = "反向",
    icon = 1000,
    text = "使所有敌人操作变为反向",
    cast_vfx = ["other/vfx_26_85"]
    };
getRow(6)->
    #race_itemCfg {
    id = 6,
    type = 1,
    param1 = [63010,63011],
    rand = [0,100,200,300,400,500,600,700,800,900,1000,1300,1600,1900],
    name = "加速",
    icon = 1001,
    text = "自身获得加速"
    };
getRow(7)->
    #race_itemCfg {
    id = 7,
    type = 4,
    param1 = [93,94],
    param2 = [0,15,0],
    rand = [0,0,0,200,200,200,200,200,200,200,200,200,200,200],
    name = "加速旋风",
    icon = 20104,
    text = "往身前丢出一个加速旋风",
    cast_vfx = ["other/vfx_26_79"]
    };
getRow(8)->
    #race_itemCfg {
    id = 8,
    type = 4,
    param1 = [91,92],
    param2 = [3.14,15,0],
    rand = [1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0],
    name = "陷阱",
    icon = 1002,
    text = "往身后丢出一个减速陷阱",
    cast_vfx = ["other/vfx_26_77"]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8}
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

