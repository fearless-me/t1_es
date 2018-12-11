%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 十二月 2018 17:24
%%%-------------------------------------------------------------------
-module(mod_map_sync).
-author("tiancheng").

-include("map_core.hrl").

%% API
-export([
    net_msg_get_remote_obj_info/1
]).

net_msg_get_remote_obj_info({MasterUid, TargetUidList}) ->
    F =
        fun(Uid) ->
            send_remote_info(MasterUid, Uid)
        end,
    lists:foreach(F, TargetUidList).

send_remote_info(MasterUid, Uid) ->
    case uid_gen:uid_type(Uid) of
        ?UID_TYPE_MON ->
            ok;
        ?UID_TYPE_NPC ->
            ok;
        ?UID_TYPE_PLAYER ->
            ok;
        _ ->
            skip
    end,
    ok.