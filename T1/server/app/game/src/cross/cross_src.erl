%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 在玩家进程内部调用，要快速返回
%%% @end
%%% Created : 28. 八月 2018 10:47
%%%-------------------------------------------------------------------
-module(cross_src).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("common_cross_inc.hrl").


%% API
-export([player_pub_data_from_cross/1, player_pub_data_to_cross/2]).


%%
%% 将源服务器玩家的一些公共数据发给跨服
%% 该函数咋玩家进程调用要快速返回
%%  {@link cross_dst:rpc_call_player_enter}
%%
player_pub_data_to_cross(Aid, Uid) ->
    Aid = player_rw:get_aid(),
    #r_to_cross_data{
        pid = self(),
        aid = Aid,
        uid = player_rw:get_uid(),
        sock= player_pub:socket(),
        player_pub = gs_cache:get_player_pub(Uid)
    }.

%%
%% 跨服回源服务器时带回来的玩家公共数据
%% ** 该函数咋玩家进程调用要快速返回 **
%%  {@link cross_dst:rpc_call_player_prepare_leave}
%%
player_pub_data_from_cross({badrpc, _} = X) ->
    ?ERROR("~p error: ~p ", [?FUNCTION_NAME, X]);
player_pub_data_from_cross({badtcp, _} = X) ->
    ?ERROR("~p error: ~p ", [?FUNCTION_NAME, X]);
player_pub_data_from_cross(_Any) ->
    ok.