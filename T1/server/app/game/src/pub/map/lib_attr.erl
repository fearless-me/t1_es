%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 15:25
%%%-------------------------------------------------------------------
-module(lib_attr).
-author("mawenhong").
-include("logger.hrl").
-include("common_record.hrl").
-include("map_unit.hrl").
-include("netmsg.hrl").
-include("combat.hrl").
-include("pub_common.hrl").
%% API
-export([
    calc/5, change_attr/1, change_attr/3, change_attr/5
]).



%%-------------------------------------------------------------------
change_attr(#r_player_change_prop_req{
    uid = Uid,
    add = AddList, multi = MultiList,
    add_del = AddList_Del, multi_del = MultiList_Del
}) ->
    change_attr_action(Uid, AddList, MultiList, AddList_Del, MultiList_Del),
    ok.

%%-------------------------------------------------------------------
change_attr(Uid, AddList, MultiList) ->
    change_attr_action(Uid, AddList, MultiList, [], []),
    ok.

change_attr(Uid, AddList, MultiList, AddList_Del, MultiList_Del) ->
    change_attr_action(Uid, AddList, MultiList, AddList_Del, MultiList_Del),
    ok.

change_attr_action(Uid, AddList, MultiList, AddList_Del, MultiList_Del) ->
    PropList = lib_unit_rw:get_attr(Uid),
    lib_attr:calc(PropList, AddList, MultiList, AddList_Del, MultiList_Del),
    ok.

calc(_PropList, _AddList, _MultiList, _AddList_Del, _MultiList_Del) ->
    ok.
