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


%% fixme 完成跨服需要调整的 
%% todo 分类整理玩家数据
%% todo 玩家部分公共数据写入跨服
%% todo 中心服操作全服的接口 要全部独立出来，可供任意服务器使用
%% todo 要处理在跨服中去跨服的问题