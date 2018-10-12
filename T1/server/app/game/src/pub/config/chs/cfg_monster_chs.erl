%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_monster_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_monster.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 怪物配置表
getRow(0) ->
    #monsterCfg{
        desc__ = "测试怪",
        id = 0,
        name = "@@>1000001<",
        type = 2,
        sub_type = 1,
        ai = 0,
        ai_param = [],
        model = "",
        born_event = 0,
        death_event = 0,
        proplist = [[?MAX_HP, ?ADD, 100000000], [?HP, ?ADD, 100000]]
    };
getRow(166) ->
    #monsterCfg{
        desc__ = "世界守护BOSS",
        id = 166,
        name = "@@>2000003<",
        type = 1,
        sub_type = 1,
        ai = 0,
        ai_param = [],
        model = "",
        born_event = 0,
        death_event = 0,
        proplist = [[?MAX_HP, ?ADD, 100000000]]
    };
getRow(177) ->
    #monsterCfg{
        desc__ = "世界守护BOSS小弟",
        id = 177,
        name = "@@>2000004<",
        type = 1,
        sub_type = 1,
        ai = 0,
        ai_param = [],
        model = "",
        born_event = 0,
        death_event = 0,
        proplist = []
    };
getRow(_) -> {}.

getKeyList() -> [
    {0},
    {166},
    {177}
].

get1KeyList() -> [
    0,
    166,
    177
].

