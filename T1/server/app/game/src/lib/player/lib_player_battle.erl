%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 14:44
%%%-------------------------------------------------------------------
-module(lib_player_battle).
-author("mawenhong").
-include("logger.hrl").
-include("mem_record.hrl").
-include("common_record.hrl").

%% API
-export([change_attr/2, change_attr/4]).

%%-------------------------------------------------------------------
change_attr(AddList, MultiList) ->
    change_attr(AddList, MultiList, [], []),
    ok.

change_attr(AddList, MultiList, AddList_Del, MultiList_Del) ->
    Uid = lib_player_rw:get_uid(),
    #m_player_map{map_pid = Pid} =lib_player_rw:get_map(),
    map_pub:player_change_attr_(
        Pid,
        #r_player_change_prop_req{
            uid = Uid,
            add = AddList,
            multi = MultiList,
            add_del = AddList_Del,
            multi_del = MultiList_Del
        }
    ),
    ok.