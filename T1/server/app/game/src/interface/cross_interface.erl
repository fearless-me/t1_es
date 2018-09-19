%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 八月 2018 15:15
%%%-------------------------------------------------------------------
-module(cross_interface).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("common_def.hrl").
-include("common_rec.hrl").
-include("common_cross_inc.hrl").
-include("gs_cache.hrl").

%% API
-export([
    get_player_src_sid/1, get_player_src_node/1,
    get_remote_server_map_mgr/2,
    get_player_cross_sid/1, get_player_cross_node/1,

    %% 
    assign_cross_for_player/1, force_assign_cross_for_player/2,

    %%
    update_player_cross/2,

    %%
    is_player_in_cross/1
]).


is_player_in_cross(Uid) ->
     my_ets:member(?ETS_CACHE_PLAYER_CROSS, Uid).

update_player_cross(Uid, Params) ->
    IsCross = gs_interface:is_cross(),
    inner_update_player_cross(IsCross, Uid, Params),
    ok.

assign_cross_for_player(Uid) ->
    case is_assign_cross(Uid) of
        true -> skip;
        _ ->
            QS = ets:fun2ms(fun(Info) when Info#m_share_server_info.type =:= ?SERVER_TYPE_CGS -> Info#m_share_server_info.sid end),
            SL = mne_ex:dirty_select(?ShareServerInfoName, QS),
            do_assign_cross_for_player(Uid, SL)
    end,
    ok.

do_assign_cross_for_player(_Uid, []) ->
    ok;
do_assign_cross_for_player(Uid, [CrossSid | _]) ->
    force_assign_cross_for_player(Uid, CrossSid),
    ok.

is_assign_cross(Uid) ->
    case mne_ex:dirty_read(?SharePlayerCrossLock, Uid) of
        [#m_share_player_cross_lock{cross_sid = Sid}] when Sid > 0 ->
            true;
        _ -> false
    end.
%%-------------------------------------------------------------------
force_assign_cross_for_player(Uid, CrossSid) ->
    Sid = gs_interface:get_sid(),
    mne_ex:write(
        ?SharePlayerCrossLock,
        #m_share_player_cross_lock{
        uid = Uid,
        src_sid = Sid,
        cross_sid = CrossSid,
        assign_time = misc_time:milli_seconds()
    }),
    ok.

%%-------------------------------------------------------------------
get_player_src_sid(Uid) -> inner_get_player_src_sid(Uid).

%%-------------------------------------------------------------------
get_player_src_node(Uid) -> inner_get_player_src_node(Uid).


%%-------------------------------------------------------------------
get_player_cross_sid(Uid) -> inner_get_player_cross_sid(Uid).

%%-------------------------------------------------------------------
get_player_cross_node(Uid) -> inner_get_player_cross_node(Uid).

%%-------------------------------------------------------------------
get_remote_server_map_mgr(Node, MapID)
    when is_atom(Node), Node =/= undefined ->
    grpc:call(Node, cross_rpc, rpc_call_get_map_mgr, [MapID]);
get_remote_server_map_mgr(_Node, _MapID) -> undefined.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
inner_get_player_src_node(Uid) ->
    Sid = inner_get_player_src_sid(Uid),
    inner_get_server_node(Sid).

%%-------------------------------------------------------------------
inner_get_player_cross_node(Uid) ->
    Sid = inner_get_player_cross_sid(Uid),
    inner_get_server_node(Sid).

%%-------------------------------------------------------------------
inner_get_player_src_sid(Uid) when is_number(Uid), Uid > 0 ->
    case mne_ex:dirty_read(?SharePlayerCrossLock, Uid) of
        [#m_share_player_cross_lock{src_sid = SrcSid}] -> SrcSid;
        _ -> undefined
    end;
inner_get_player_src_sid(_Uid) -> undefined.

%%-------------------------------------------------------------------
inner_get_player_cross_sid(Uid) when is_number(Uid), Uid > 0 ->
    case mne_ex:dirty_read(?SharePlayerCrossLock, Uid) of
        [#m_share_player_cross_lock{cross_sid = DstSid}] -> DstSid;
        _ -> undefined
    end;
inner_get_player_cross_sid(_Uid) -> undefined.


%%-------------------------------------------------------------------
inner_get_server_node(Sid) when is_number(Sid), Sid > 0 ->
    case mne_ex:dirty_read(?ShareServerInfoName, Sid) of
        [#m_share_server_info{node = Node}] -> Node;
        _ -> undefined
    end;
inner_get_server_node(_Sid) -> undefined.

%%-------------------------------------------------------------------
inner_update_player_cross(false, Uid, Params) ->
    case cross_interface:is_player_in_cross(Uid) of
        true ->
            Node = cross_interface:get_player_cross_node(Uid),
            grpc:cast(Node, cross_dst, rpc_cast_update_player, [Params]);
        _Any -> skip
    end,
    ok;
inner_update_player_cross(_Any, _Uid, _Params) -> skip.


