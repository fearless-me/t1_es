%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 提供给地图进程所有模块访问的一些方法
%%% @end
%%% Created : 24. 十二月 2018 16:54
%%%-------------------------------------------------------------------
-module(mod_map_pub).
-author("Administrator").
-include("logger.hrl").
-include("uid_object_type.hrl").

%% API
-export([kick_all_player/0]).
-export([broadcast_msg/1, broadcast_msg/2, broadcast_net_msg/1]).

%%-------------------------------------------------------------------
-spec broadcast_msg(MsgId :: term()) -> ok.
broadcast_msg(MsgId) ->
    maps:fold(
        fun(_, Uid, _) ->
            catch gs_interface:send_msg(Uid, MsgId)
        end, 0, map_rw:obj_maps_with_type(?UID_TYPE_PLAYER)),
    ok.

-spec broadcast_msg(MsgId :: term(), Msg :: term()) -> ok.
broadcast_msg(MsgId, Msg) ->
    maps:fold(
        fun(_, Uid, _) ->
            catch gs_interface:send_msg(Uid, MsgId, Msg)
        end, 0, map_rw:obj_maps_with_type(?UID_TYPE_PLAYER)),
    ok.

-spec broadcast_net_msg(NetMsg :: tuple()) -> ok.
broadcast_net_msg(NetMsg) ->
    maps:fold(
        fun(_, Uid, _) ->
            catch gs_interface:send_net_msg(Uid, NetMsg)
        end, 0, map_rw:obj_maps_with_type(?UID_TYPE_PLAYER)),
    ok.

kick_all_player() ->
    maps:fold(
        fun(_, Uid, _) ->
            ?WARN("~p|~p kick player to born map ~p", [self(), misc:registered_name(), Uid]),
            catch player_interface:kick_to_born_map_(Uid)
        end, 0, map_rw:obj_maps_with_type(?UID_TYPE_PLAYER)),
    ok.
