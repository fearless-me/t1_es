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
-include("pub_def.hrl").
-include("gs_common_rec.hrl").
-include("gs_cache.hrl").

%% API
-export([
    online/0,               %% 在跨服上线
    offline/0,              %% 在跨服下线
    check/0,                %% 周期性检查跨服
    change_map_before/2,    %% 从跨服到普通服 / 从普通服到跨服 (切地图前)
    change_map_after/3      %% 从跨服到普通服 / 从普通服到跨服 (切地图后)
]).

-export([
    clear/0,
    process_down/1
]).

process_down({'DOWN', MonitorRef, _, _Pid, _Info} = Msg) ->
    case get_ref() of
        MonitorRef -> bgporcess_down();
        _Any  -> ?TRY_CATCH(player:on_info_msg(Msg))
    end,
    ok.

bgporcess_down()->
    ?WARN("player ~p of account ~p bgprocess ~p is 'DOWN', kick to born map",
        [player_rw:get_uid(), player_rw:get_aid(), get_bgpid()]),
    case get_bgpid() of
        undefined -> skip;
        _->
            clear(),
            player_pub:kick_to_born_map_(cross_nodedown)
    end.


%% 在跨服上线
online() ->
    #m_player_map{map_id = Mid} = player_rw:get_map(),
    IsDstCross = map_creator_interface:is_cross_map(Mid),
    do_online(IsDstCross).

%% 在跨服下线
offline() -> clear().

%% 从跨服到普通服 / 从普通服到跨服 (切地图前)
change_map_before(SrcMid, DstMid) ->
    IsSrcCross = map_creator_interface:is_cross_map(SrcMid),
    IsDstCross = map_creator_interface:is_cross_map(DstMid),
    do_change_map_before(IsSrcCross, IsDstCross).

%% 从跨服到普通服 / 从普通服到跨服 (切地图后)
change_map_after(SrcMid, DstMid, IsOk) ->
    IsSrcCross = map_creator_interface:is_cross_map(SrcMid),
    IsDstCross = map_creator_interface:is_cross_map(DstMid),
    do_change_map_after(IsSrcCross, IsDstCross, IsOk),
    ok.

%%-------------------------------------------------------------------

%% 在跨服上线
do_online(true) -> enter_cross_wrap();
do_online(_) -> clear().


%%-------------------------------------------------------------------
check()-> ok.


%% 从跨服到普通服
do_change_map_before(true, false) ->
    Uid = player_rw:get_uid(),
    Node = get_bgnode(),
    Ret = grpc:call({Node, Uid}, cross_dst, rpc_call_player_prepare_leave, [Uid, get_bgpid()]),
    cross_src:player_pub_data_from_cross(Ret);
%% 从普通服到跨服
do_change_map_before(false, true) ->
    enter_cross_wrap();
do_change_map_before(_IsSrcCross, _IsDstCross) ->
    true.

%% 跨服到跨服 | 普通服到跨服 - 成功
do_change_map_after(_IsSrcCross, true, true) ->
    ok;
%%  - 成功
%%do_change_map_after(false, true, true) ->
%%    Aid = player_rw:get_aid(),
%%    Uid = player_rw:get_uid(),
%%    Node = get_bgnode(),
%%    Data = cross_src:player_pub_data_to_cross(Aid, Uid),
%%    gs_cache_interface:add_player_cross(Uid),
%%    grpc:cast(Node, cross_dst, rpc_call_player_enter_only_update, [Data]);
%% 其他任意情况下，清除跨服
do_change_map_after(true, _, false) ->
    clear(),
    player_pub:kick_to_born_map_(cross_failed);
do_change_map_after(_IsSrcCross, _IsDstCross, _IsOk) ->
    clear().


%%rpc_check({badrpc, _} = X, F) ->
%%    ?ERROR("~p error: ~p ", [F, X]),
%%    false;
%%rpc_check({badtcp, _} = X, F) ->
%%    ?ERROR("~p error: ~p ", [F, X]),
%%    false;
%%rpc_check(_Any, _F) ->
%%    true.

enter_cross_wrap()->
    Aid = player_rw:get_aid(),
    Uid = player_rw:get_uid(),
    Node = cross_interface:get_player_cross_node(Uid),
    Data = cross_src:player_pub_data_to_cross(Aid, Uid),
    case grpc:call({Node, Uid}, cross_dst, rpc_call_player_enter, [Data]) of
        {true, BgPid} ->
            monitor_ack(Aid, Uid, BgPid),
            true;
        Any ->
            ?ERROR("player ~p of account ~p enter cross error ~p",
                [Uid, Aid, Any]),
            false
    end.

monitor_ack(Aid, Uid, BgPid) ->
    Ref = erlang:monitor(process, BgPid),
    set_bgpid(BgPid),
    set_ref(Ref),
    gs_cache_interface:add_player_cross(Uid),
    gs_cache_interface:update_online_player(Uid, {#m_cache_online_player.pid_bg, BgPid}),
    cross_player_bg:ack(BgPid),
    ?WARN("player ~p of account ~p monitor BACK PROCESS ~p ref ~p",
        [Uid, Aid, BgPid, Ref]),
    ok.

clear() ->
    Uid = player_rw:get_uid(),
    catch do_clear(get_bgpid()),
    catch gs_cache_interface:del_player_cross(Uid),
    catch erlang:erase(bgpid),
    catch erlang:erase(bgpid_ref),
    catch gs_cache_interface:update_online_player(Uid, {#m_cache_online_player.pid_bg, undefined}),
    ok.

do_clear(undefined) -> skip;
do_clear(_) ->
    catch erlang:demonitor(get_ref()),
    catch erlang:exit(get_bgpid(), clear_game),
    ok.



get_bgpid()-> erlang:get(bgpid).
set_bgpid(Pid) -> erlang:put(bgpid, Pid).
set_ref(Ref) -> erlang:put(bgpid_ref, Ref).
get_ref()  -> erlang:get(bgpid_ref).
get_bgnode() -> ?TRY_CATCH_RET_ONLY(erlang:node(get_bgpid()), undefined).