%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 八月 2018 15:15
%%%-------------------------------------------------------------------
-module(gs_cross_interface).
-author("mawenhong").
-include("logger.hrl").
-include("pub_rec.hrl").
-include("common_rec.hrl").

%% API
-export([
    get_player_src_sid/1, get_player_src_node/1,
    get_remote_server_map_mgr/2,
    get_player_cross_sid/1, get_player_cross_node/1
]).

%%-------------------------------------------------------------------
get_player_src_sid(Aid) -> inner_get_player_src_sid(Aid).

%%-------------------------------------------------------------------
get_player_src_node(Aid) -> inner_get_player_src_node(Aid).


%%-------------------------------------------------------------------
get_player_cross_sid(Aid) -> inner_get_player_cross_sid(Aid).

%%-------------------------------------------------------------------
get_player_cross_node(Aid) -> inner_get_player_cross_node(Aid).

%%-------------------------------------------------------------------
get_remote_server_map_mgr(Node, MapID)
    when is_atom(Node), Node =/= undefined ->
    grpc:call(Node, cross_rpc, rpc_call_get_map_mgr, [MapID]);
get_remote_server_map_mgr(_Node, _MapID) -> undefined.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
inner_get_player_src_node(Aid) ->
    Sid = inner_get_player_src_sid(Aid),
    inner_get_server_node(Sid).

%%-------------------------------------------------------------------
inner_get_player_cross_node(Aid) ->
    Sid = inner_get_player_cross_sid(Aid),
    inner_get_server_node(Sid).

%%-------------------------------------------------------------------
inner_get_player_src_sid(Aid) when is_number(Aid), Aid > 0 ->
    case mne_ex:dirty_read(m_player_cross_lock, Aid) of
        [#m_player_cross_lock{src_sid = SrcSid}] -> SrcSid;
        _ -> undefined
    end;
inner_get_player_src_sid(_Aid) -> undefined.

%%-------------------------------------------------------------------
inner_get_player_cross_sid(Aid) when is_number(Aid), Aid > 0 ->
    case mne_ex:dirty_read(m_player_cross_lock, Aid) of
        [#m_player_cross_lock{cross_sid = DstSid}] -> DstSid;
        _ -> undefined
    end;
inner_get_player_cross_sid(_Aid) -> undefined.


%%-------------------------------------------------------------------
inner_get_server_node(Sid)  when is_number(Sid), Sid > 0->
    case mne_ex:dirty_read(m_server_info, Sid) of
        [#m_server_info{node = Node}] -> Node;
        _ -> undefined
    end;
inner_get_server_node(_Sid) -> undefined.


