%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 八月 2018 10:47
%%%-------------------------------------------------------------------
-module(cross_src).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("common_cross_inc.hrl").

%%
%% @doc
%%
%% 在玩家进程内部调用，要快速返回
%%
%% @end
%%

%% API
-export([player_pub_data_from_cross/1, player_pub_data_to_cross/2]).


%% @doc
%% 将源服务器玩家的一些公共数据发给跨服
%% 该函数咋玩家进程调用要快速返回
%% @reference cross_dst:rpc_call_player_enter
%% @end
player_pub_data_to_cross(Aid, Uid) ->
    Aid = lib_player_rw:get_aid(),
    #r_to_cross_data{
        pid = self(),
        aid = Aid,
        uid = lib_player_rw:get_uid(),
        sock= lib_player_pub:socket(),
        player_pub = gs_cache:get_player_pub(Uid)
    }.

%% @doc
%% 跨服回源服务器时带回来的玩家公共数据
%% ** 该函数咋玩家进程调用要快速返回 **
%% @reference cross_dst:rpc_call_player_prepare_leave
%% @end
player_pub_data_from_cross({badrpc, _} = X) ->
    ?ERROR("~p error: ~p ", [?FUNCTION_NAME, X]);
player_pub_data_from_cross({badtcp, _} = X) ->
    ?ERROR("~p error: ~p ", [?FUNCTION_NAME, X]);
player_pub_data_from_cross(_Any) ->
    ok.