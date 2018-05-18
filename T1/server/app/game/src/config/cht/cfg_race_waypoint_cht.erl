%% coding: latin-1
%%: 实现
-module(cfg_race_waypoint_cht).
-compile(export_all).
-include("cfg_race_waypoint.hrl").


getRow(1)->
    #race_waypointCfg {
    id = 1,
    waypoint = [730,481]
    };
getRow(2)->
    #race_waypointCfg {
    id = 2,
    waypoint = [868,470]
    };
getRow(3)->
    #race_waypointCfg {
    id = 3,
    waypoint = [861,323]
    };
getRow(4)->
    #race_waypointCfg {
    id = 4,
    waypoint = [789,300]
    };
getRow(5)->
    #race_waypointCfg {
    id = 5,
    waypoint = [798,218]
    };
getRow(6)->
    #race_waypointCfg {
    id = 6,
    waypoint = [885,217]
    };
getRow(7)->
    #race_waypointCfg {
    id = 7,
    waypoint = [1032,231]
    };
getRow(8)->
    #race_waypointCfg {
    id = 8,
    waypoint = [1064,293]
    };
getRow(9)->
    #race_waypointCfg {
    id = 9,
    waypoint = [1065,373]
    };
getRow(10)->
    #race_waypointCfg {
    id = 10,
    waypoint = [1132,408]
    };
getRow(11)->
    #race_waypointCfg {
    id = 11,
    waypoint = [1136,506]
    };
getRow(12)->
    #race_waypointCfg {
    id = 12,
    waypoint = [1135,772]
    };
getRow(13)->
    #race_waypointCfg {
    id = 13,
    waypoint = [1126,873]
    };
getRow(14)->
    #race_waypointCfg {
    id = 14,
    waypoint = [981,900]
    };
getRow(15)->
    #race_waypointCfg {
    id = 15,
    waypoint = [875,898]
    };
getRow(16)->
    #race_waypointCfg {
    id = 16,
    waypoint = [766,899]
    };
getRow(17)->
    #race_waypointCfg {
    id = 17,
    waypoint = [680,796]
    };
getRow(18)->
    #race_waypointCfg {
    id = 18,
    waypoint = [670,679]
    };
getRow(19)->
    #race_waypointCfg {
    id = 19,
    waypoint = [557,647]
    };
getRow(20)->
    #race_waypointCfg {
    id = 20,
    waypoint = [518,510]
    };
getRow(21)->
    #race_waypointCfg {
    id = 21,
    waypoint = [515,387]
    };
getRow(22)->
    #race_waypointCfg {
    id = 22,
    waypoint = [519,288]
    };
getRow(23)->
    #race_waypointCfg {
    id = 23,
    waypoint = [619,245]
    };
getRow(24)->
    #race_waypointCfg {
    id = 24,
    waypoint = [679,316]
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
    {8},
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24}
    ].

get1KeyList()->[
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
    24
    ].

