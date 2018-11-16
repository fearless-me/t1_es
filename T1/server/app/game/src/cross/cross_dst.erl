%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 在玩家进程内部调用，要快速返回
%%% @end
%%% Created : 28. 八月 2018 10:48
%%%-------------------------------------------------------------------
-module(cross_dst).
-author("mawenhong").
-include("logger.hrl").
-include("common_cross_inc.hrl").
-include("gs_cache.hrl").

%% API
-export([
    rpc_call_player_enter/1, rpc_call_player_prepare_leave/2, rpc_call_player_leave/2,
    rpc_call_player_offline/2, rpc_call_del_player/2
]).


%%
%% 玩家跨服时传过来的公共数据
%% {@link cross_src:player_pub_data_to_cross}
%%
rpc_call_player_enter(#r_to_cross_data{
    aid = Aid,
    uid = Uid,
    player_pub = Pub,
    player_online = PlayerOnline
}) ->
    %% fixme 初始化数据
    gs_cache_interface:online_cross(Pub, PlayerOnline),
    ?INFO("player ~w of account ~p enter cross", [Uid, Aid]),
    ok.



%%
%% 返回给源服务器时玩家公共数据
%% {@link cross_src:player_pub_data_from_cross}
%%
rpc_call_player_prepare_leave(Aid, Uid) ->
    %%
    %% todo  返回给普通服的数据
    ?WARN("player ~w of account ~p prpare to leave cross", [Uid, Aid]),
    ok.

%%
%% 成功离开跨服
%%
rpc_call_player_leave(Aid, Uid) ->
    gs_cache_interface:offline(Aid, Uid),
    ?WARN("player ~w of account ~p leave cross", [Uid, Aid]),
    ok.

%%
%% 玩家在跨服地图下线
%% {@link cross_src:player_pub_data_from_cross}
%%
rpc_call_player_offline(Aid, Uid) ->
    gs_cache_interface:offline(Aid, Uid),
    %%fixme 返回给普通服的数据
    ?INFO("player ~w of account ~p offline in cross", [Uid, Aid]),
    ok.


rpc_call_del_player(Aid, Uid) ->
    gs_cache_interface:offline(Aid, Uid),
    ?INFO("player ~w of account ~p del in cross", [Uid, Aid]),
    ok.

