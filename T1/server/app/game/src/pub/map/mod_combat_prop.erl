%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 九月 2018 10:49
%%%-------------------------------------------------------------------
-module(mod_combat_prop).
-author("mawenhong").

%% API
-export([change_combat_prop/3, change_combat_prop/5]).


change_combat_prop(Uid, AddList, MultiList) ->
    change_combat_prop(Uid, AddList, MultiList, [], []),
    ok.

change_combat_prop(_Uid, AddList, MultiList, AddList_Del, MultiList_Del) ->
    combat_prop_calc:calc([], AddList, MultiList, AddList_Del, MultiList_Del),
    ok.