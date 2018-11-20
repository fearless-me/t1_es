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
    rpc_call_player_enter/1, rpc_call_player_enter_only_update/1,
    rpc_call_player_prepare_leave/1,
    rpc_call_player_clear/1
]).


%%
%% 玩家跨服时传过来的公共数据
%% {@link cross_src:player_pub_data_to_cross}
%%
rpc_call_player_enter(#r_to_cross_data{
    aid = Aid,
    uid = Uid,
    pid = Pid,
    player_pub = Pub,
    player_online = PlayerOnline
}) ->
    try
        case cross_player_sup:start_child([[Aid, Uid, Pid]]) of
            {ok, BgPid} ->
                ?INFO("player ~w of account ~p enter cross", [Uid, Aid]),
                gs_cache_interface:online_cross(Pub, PlayerOnline),
                {true, BgPid};
            Error ->
                {false, Error}
        end
    catch _ : Exception: _ ->
        catch gs_cache_interface:offline(Aid, Uid),
        {fasle, Exception}
    end.

rpc_call_player_enter_only_update(#r_to_cross_data{
    aid = Aid,
    uid = Uid,
    player_pub = Pub,
    player_online = PlayerOnline
}) ->
    ?INFO("update player ~w of account ~p in cross", [Uid, Aid]),
    gs_cache_interface:online_cross(Pub, PlayerOnline),
    ok.


%%
%% 返回给源服务器时玩家公共数据
%% {@link cross_src:player_pub_data_from_cross}
%%
rpc_call_player_prepare_leave(_BgPid) ->
    ok.


rpc_call_player_clear(BgPid) ->
    catch cross_player_bg:clear(BgPid),
    ok.
