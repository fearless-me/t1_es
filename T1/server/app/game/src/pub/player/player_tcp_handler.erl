%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% tcp connect -> on_init
%%% receive data -> on_data
%%% tcp close/ tcp error -> on_close
%%% tcp_handler:active_stop ->  on_close
%%%
%%% gen_server:handle_info -> on_info_msg
%%% gen_server:handle_call -> on_call_msg
%%% gen_server:handle_cast -> on_info_cast
%%% 
%%% @end
%%% Created : 11. 五月 2018 14:27
%%%-------------------------------------------------------------------
-module(player_tcp_handler).
-author("mawenhong").
-behaviour(tcp_behaviour).

-include("logger.hrl").
-include("pub_def.hrl").
-include("netconf.hrl").
-include("netmsg.hrl").
-include("gs_cache.hrl").
-include("player_status.hrl").


%% API
-export([shutdown/1]).
-export([stop/1, send_net_msg/1]).
-export([on_init/1, on_data/3, on_close/3]).
-export([on_info_msg/2, on_call_msg/3, on_cast_msg/2, on_net_msg/2]).
-export([socket/1, socket/0]).



%%-------------------------------------------------------------------
-define(SocketKey, socketRef___).
-define(NET_IDLE_TIME, 30 * 1000).
-record(r_player_state, {}).


%%-------------------------------------------------------------------
-spec shutdown(How) -> ok when
    How :: read | write | read_write.
shutdown(How) ->
    tcp_handler:shutdown(socket(), How).

stop(Reason) ->
    ?INFO("aid ~p uid ~p pid ~p stopped with reason ~p",
        [player_rw:get_aid(), player_rw:get_uid(), self(), Reason]),
    catch player_pub:send_net_msg(#pk_GS2U_KickByServer{reason = io_lib:format("~p", [Reason])}),
    tcp_handler:active_stop(Reason).

%%-------------------------------------------------------------------
send_net_msg(IoList) when is_list(IoList) ->
    tcp_handler:direct_send_net_msg(socket(), IoList);
send_net_msg(Msg) ->
    {_Bytes1, IoList} = tcp_codec:encode(Msg),
%%    ?DEBUG("~p send ~p bytes, msg ~w", [player_rw:get_uid(), Bytes1, Msg]),
    tcp_handler:direct_send_net_msg(socket(), IoList),
    ok.

%%-------------------------------------------------------------------
on_init(Socket) ->
    {Ip, Port} = misc:peername(Socket),
    socket(Socket),
    player_priv:init(),
    set_latest_net_time(),
    check_idle_msg(),
    ?WARN("client connected: ~p ~ts:~p, ~p", [Socket, Ip, Port,self()]),
    {ok, #r_player_state{}}.

%%-------------------------------------------------------------------
on_data(Socket, Data, S) ->
    set_latest_net_time(),
    tcp_codec:decode(fun player_tcp_handler:on_net_msg/2, Socket, Data),
    S.

%%-------------------------------------------------------------------
on_close(Socket, Reason, S) ->
    player_priv:offline(Reason),
    ?INFO("~p socket ~p close,reason:~p", [self(), Socket, Reason]),
    S.

%%-------------------------------------------------------------------
on_info_msg(check_net, S) ->
    check_idle(),
    S;
on_info_msg({kick_role, Reason}, S) ->
    player_tcp_handler:stop(Reason),
    S;
on_info_msg({net_msg, NetMsg}, S) ->
    player_tcp_handler:send_net_msg(NetMsg),
    S;
on_info_msg({login_ack, Msg}, S) ->
    ?DEBUG("login_ack:~p", [Msg]),
    player_priv:login_ack(Msg),
    S;
on_info_msg({load_player_list_ack, List}, S) ->
    ?DEBUG("load_player_list_ack:~p", [List]),
    player_priv:loaded_player_list(List),
    S;
on_info_msg({load_player_data_ack, Player}, S) ->
    ?DEBUG("load_player_data_ack"),
    player_priv:loaded_player(Player),
    S;
on_info_msg({create_player_ack, Ack}, S) ->
    ?DEBUG("create_player_ack"),
    player_priv:create_player_ack(Ack),
    S;
on_info_msg(return_to_pre_map_req, S) ->
    player_map_priv:return_to_old_map_call(),
    S;
on_info_msg({passive_change_req, {DestMapID, LineId, TarPos}}, S) ->
    player_map_priv:serve_change_map_call(DestMapID, LineId, TarPos),
    S;
on_info_msg(passive_kick_to_born_map, S) ->
    player_map_priv:kick_to_born_map(),
    S;
on_info_msg({teleport, NewPos}, S) ->
    player_map_priv:teleport_call(NewPos),
    S;
on_info_msg({msg_transfer_to_map, MsgId}, S) ->
    player_pub:send_map_msg_(MsgId),
    S;
on_info_msg({msg_transfer_to_map, MsgId, Msg}, S) ->
    player_pub:send_map_msg_(MsgId, Msg),
    S;
on_info_msg(Info, S) ->
    ?TRY_CATCH(player:on_info_msg(Info)),
    S.

%%-------------------------------------------------------------------
on_call_msg(Request, From, S) ->
    ?DEBUG("call ~p from ~p", [Request, From]),
    Ret = player:on_call_msg(Request, From),
    {Ret, S}.

%%-------------------------------------------------------------------
on_cast_msg(Request, S) ->
    player:on_cast_msg(Request),
    S.

%%-------------------------------------------------------------------
on_net_msg(Cmd, Msg) ->
%%    ?DEBUG("route_msg id ~p msg ~w",[Cmd, Msg]),
    ?TRY_CATCH(route_msg(Cmd, Msg)),
    ok.

route_msg(Cmd, Msg) ->
    %%1. hook
%%    ?DEBUG("route(~w)",[Msg]),
    Status = player_rw:get_status(),
    filter_msg(Status, Cmd, Msg),
    ok.

filter_msg(?PS_ERROR, Cmd, Msg) ->
    log_error_msg(status_forbid, Cmd, Msg);
filter_msg(?PS_OFFLINE, Cmd, Msg) ->
    log_error_msg(status_forbid, Cmd, Msg);
filter_msg(_status, Cmd, Msg) ->
    dispatcher_msg(Cmd, Msg).

dispatcher_msg(Cmd = ?U2GS_Login_Normal, Msg) ->
    dispatcher_msg_s(?PS_INIT, Cmd, Msg);
dispatcher_msg(Cmd = ?U2GS_RequestCreatePlayer, Msg) ->
    dispatcher_msg_s(?PS_WAIT_SELECT_CREATE, Cmd, Msg);
dispatcher_msg(Cmd = ?U2GS_SelPlayerEnterGame, Msg) ->
    dispatcher_msg_s(?PS_WAIT_SELECT_CREATE, Cmd, Msg);
dispatcher_msg(_, Msg) ->
    player_netmsg:handle(Msg).


dispatcher_msg_s(NeedStatus, Cmd, Msg) ->
    case player_rw:get_status() of
        NeedStatus -> player_netmsg:handle(Msg);
        _ -> log_error_msg(status_error, Cmd, Msg)
    end.

log_error_msg(Reason, Cmd, Msg) ->
    ?ERROR("~p ~p status ~p, Cmd ~p, msg ~w",
        [player_rw:get_uid(), Reason, player_rw:get_status(), Cmd, Msg]).

%%-------------------------------------------------------------------
socket(Socket) -> put(?SocketKey, Socket).
socket() -> get(?SocketKey).

%%-------------------------------------------------------------------
set_latest_net_time() -> put('RECV_NETMSG_LATEST', misc_time:milli_seconds()).
check_idle_msg() -> erlang:send_after(?NET_IDLE_TIME, self(), check_net).
check_idle() ->
    try
        case misc_time:milli_seconds() - get('RECV_NETMSG_LATEST') > ?NET_IDLE_TIME of
            true -> player_tcp_handler:stop(net_heartbeat_stop);
            false -> check_idle_msg()
        end
    catch _ : _ : _ ->
        player_tcp_handler:stop(net_heartbeat_stop)
    end.