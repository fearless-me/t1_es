%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 八月 2018 10:53
%%%-------------------------------------------------------------------
-module(cross_rpc).
-author("mawenhong").

%% API
-export([rpc_call_get_map_mgr/1]).

rpc_call_get_map_mgr(MapID) ->
    gs_map_creator_interface:map_mgr_l(MapID).
