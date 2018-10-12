%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 九月 2018 10:11
%%%-------------------------------------------------------------------
-module(player_cross_priv).
-author("mawenhong").

-include("logger.hrl").
-include("gs_common_rec.hrl").
-include("gs_cache.hrl").

%% API
-export([
    online/0,               %% 在跨服上线
    offline/0,              %% 在跨服下线
    change_map_before/2,    %% 从跨服到普通服 / 从普通服到跨服 (切地图前)
    change_map_after/3      %% 从跨服到普通服 / 从普通服到跨服 (切地图后)
]).

%% 在跨服上线
online() ->
    #m_player_map{map_id = Mid} = player_rw:get_map(),
    IsDstCross = map_creator_interface:is_cross_map(Mid),
    Ret = do_online(IsDstCross),
    rpc_check(Ret, ?FUNCTION_NAME).

%% 在跨服下线
offline() ->
    #m_player_map{map_id = Mid} = player_rw:get_map(),
    IsInCross = map_creator_interface:is_cross_map(Mid),
    do_offline(IsInCross).

%% 从跨服到普通服 / 从普通服到跨服 (切地图前)
change_map_before(SrcMid, DstMid) ->
    IsSrcCross = map_creator_interface:is_cross_map(SrcMid),
    IsDstCross = map_creator_interface:is_cross_map(DstMid),
    do_change_map_before(IsSrcCross, IsDstCross),
    ok.
%% 从跨服到普通服 / 从普通服到跨服 (切地图后)
change_map_after(SrcMid, DstMid, IsOk) ->
    IsSrcCross = map_creator_interface:is_cross_map(SrcMid),
    IsDstCross = map_creator_interface:is_cross_map(DstMid),
    do_change_map_after(IsSrcCross, IsDstCross, IsOk),
    ok.

%%-------------------------------------------------------------------

%% 在跨服上线
do_online(true) ->
    Aid = player_rw:get_aid(),
    Uid = player_rw:get_uid(),
    Node = cross_interface:get_player_cross_node(Uid),
    Data = cross_src:player_pub_data_to_cross(Aid, Uid),
    gs_cache_interface:add_player_cross(Uid),
    grpc:call(Node, cross_dst, rpc_call_player_enter, [Data]);
do_online(_) -> ok.


%% 在跨服下线
do_offline(true) ->
    Aid = player_rw:get_aid(),
    Uid = player_rw:get_uid(),
    Node = cross_interface:get_player_cross_node(Uid),
    %% fixme 跨服回传的数据处理
    gs_cache_interface:del_player_cross(Uid),
    Ret = grpc:call(Node, cross_dst, rpc_call_player_offline, [Aid, Uid]),
    cross_src:player_pub_data_from_cross(Ret);
do_offline(_) -> ok.

%% 从跨服到普通服
do_change_map_before(true, false) ->
    Aid = player_rw:get_aid(),
    Uid = player_rw:get_uid(),
    Node = cross_interface:get_player_cross_node(Uid),
    %% fixme 跨服回传的数据处理
    Ret = rpc:call(Node, cross_dst, rpc_call_player_prepare_leave, [Aid, Uid]),
    cross_src:player_pub_data_from_cross(Ret);
%% 从普通服到跨服
do_change_map_before(false, true) ->
    Aid = player_rw:get_aid(),
    Uid = player_rw:get_uid(),
    Node = cross_interface:get_player_cross_node(Uid),
    Data = cross_src:player_pub_data_to_cross(Aid, Uid),
    gs_cache_interface:add_player_cross(Uid),
    Ret = grpc:call(Node, cross_dst, rpc_call_player_enter, [Data]),
    rpc_check(Ret, ?FUNCTION_NAME);
do_change_map_before(_IsSrcCross, _IsDstCross) ->
    ok.

%% 从跨服到普通服
do_change_map_after(true, false, true) ->
    Aid = player_rw:get_aid(),
    Uid = player_rw:get_uid(),
    Node = cross_interface:get_player_cross_node(Uid),
    gs_cache_interface:del_player_cross(Uid),
    Ret = rpc:cast(Node, cross_dst, rpc_call_player_leave, [Aid, Uid]),
    rpc_check(Ret, ?FUNCTION_NAME);
%% 从普通服到跨服
do_change_map_after(false, true, true) ->
    Aid = player_rw:get_aid(),
    Uid = player_rw:get_uid(),
    Node = cross_interface:get_player_cross_node(Uid),
    Data = cross_src:player_pub_data_to_cross(Aid, Uid),
    gs_cache_interface:add_player_cross(Uid),
    grpc:cast(Node, cross_dst, rpc_call_player_enter, [Data]);
do_change_map_after(false, true, false) ->
    Aid = player_rw:get_aid(),
    Uid = player_rw:get_uid(),
    Node = cross_interface:get_player_cross_node(Uid),
    gs_cache_interface:del_player_cross(Uid),
    grpc:cast(Node, cross_dst, rpc_call_del_player, [Aid, Uid]);
do_change_map_after(_IsSrcCross, _IsDstCross, _IsOk) ->
    ok.


rpc_check({badrpc, _} = X, F) ->
    ?ERROR("~p error: ~p ", [F, X]);
rpc_check({badtcp, _} = X, F) ->
    ?ERROR("~p error: ~p ", [F, X]);
rpc_check(_Any, _F) ->
    ok.