%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 九月 2018 10:49
%%%-------------------------------------------------------------------
-module(mod_attr).
-author("mawenhong").

%% API
-export([change_attr/3, change_attr/5]).


change_attr(Uid, AddList, MultiList) ->
    change_attr(Uid, AddList, MultiList, [], []),
    ok.

change_attr(Uid, AddList, MultiList, AddList_Del, MultiList_Del) ->
    attr_calc:calc([], AddList, MultiList, AddList_Del, MultiList_Del),
    ok.