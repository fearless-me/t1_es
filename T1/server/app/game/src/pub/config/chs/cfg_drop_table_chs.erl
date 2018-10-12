%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_drop_table_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_drop_table.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 掉落表
getRow(1, 0, 2) ->
    #drop_tableCfg{
        desc__ = "dsAS",
        drop_id = 1,
        drop_group_id = 0,
        item_id = 2,
        array_test1 = [],
        array_test2 = []
    };
getRow(1, 10, 0) ->
    #drop_tableCfg{
        desc__ = "假",
        drop_id = 1,
        drop_group_id = 10,
        item_id = 0,
        array_test1 = [],
        array_test2 = []
    };
getRow(1, 10, 1) ->
    #drop_tableCfg{
        desc__ = "aaaaabbc",
        drop_id = 1,
        drop_group_id = 10,
        item_id = 1,
        array_test1 = [],
        array_test2 = []
    };
getRow(4, 24, 7) ->
    #drop_tableCfg{
        desc__ = "测试测试",
        drop_id = 4,
        drop_group_id = 24,
        item_id = 7,
        array_test1 = [],
        array_test2 = []
    };
getRow(5, 3, 22) ->
    #drop_tableCfg{
        desc__ = "背锅侠",
        drop_id = 5,
        drop_group_id = 3,
        item_id = 22,
        array_test1 = [],
        array_test2 = []
    };
getRow(6, 2, 3) ->
    #drop_tableCfg{
        desc__ = "海螺被吃掉",
        drop_id = 6,
        drop_group_id = 2,
        item_id = 3,
        array_test1 = [],
        array_test2 = []
    };
getRow(7, 3, 98) ->
    #drop_tableCfg{
        desc__ = "哈哈，乱码问题解决了！棒棒棒3423424fgdfgsfgsfddfg古老酝杜酝酝本",
        drop_id = 7,
        drop_group_id = 3,
        item_id = 98,
        array_test1 = [1, 2, 3, 4, 5, 6, 7],
        array_test2 = [[1, 2.0], [2.0, 5], [7, 6]]
    };
getRow(_, _, _) -> {}.

getKeyList() -> [
    {1, 0, 2},
    {1, 10, 0},
    {1, 10, 1},
    {4, 24, 7},
    {5, 3, 22},
    {6, 2, 3},
    {7, 3, 98}
].

get1KeyList() -> [
    1,
    1,
    1,
    4,
    5,
    6,
    7
].

get2KeyList(1) -> [
    {0, 2},
    {10, 0},
    {10, 1}
];
get2KeyList(4) -> [
    {24, 7}
];
get2KeyList(5) -> [
    {3, 22}
];
get2KeyList(6) -> [
    {2, 3}
];
get2KeyList(7) -> [
    {3, 98}
];
get2KeyList(_) -> [].

get3KeyList(1, 0) -> [
    2
];
get3KeyList(1, 10) -> [
    0,
    1
];
get3KeyList(4, 24) -> [
    7
];
get3KeyList(5, 3) -> [
    22
];
get3KeyList(6, 2) -> [
    3
];
get3KeyList(7, 3) -> [
    98
];
get3KeyList(_, _) -> [].
