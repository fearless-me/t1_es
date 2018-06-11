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
-module(mod_player).
-author("mawenhong").
-behaviour(tcp_behaviour).

-include("logger.hrl").
-include("netconf.hrl").
-include("player_status.hrl").
-include("mem_record.hrl").
-include("pub_common.hrl").
-include("player_status.hrl").
-include("netmsg.hrl").

%% API
-export([shutdown/1]).
-export([stop/1, direct_stop/0, send/1]).
-export([on_init/1, on_data/3, on_close/3]).
-export([on_info_msg/2, on_call_msg/3, on_cast_msg/2, on_net_msg/2]).
-export([socket/1, socket/0]).



%%-------------------------------------------------------------------
-define(SocketKey,socketRef___).
-define(NET_IDLE_TIME, 10*60*1000).
-record(r_player_state,{}).


%%-------------------------------------------------------------------
-spec shutdown(How) -> ok when
    How :: read | write | read_write.
shutdown(How) -> 
    tcp_handler:shutdown(socket(), How).

stop(Reason)->
    ?INFO("~p stopped with reason ~p",[self(), Reason]),
    tcp_handler:active_stop(Reason).

direct_stop()->
    erlang:exit(self(), normal).
%%-------------------------------------------------------------------
send(IoList) when is_list(IoList)->
    tcp_handler:direct_send_net_msg(socket(), IoList);
send(Msg) ->
    ?INFO("uid ~p send to client ~w",[lib_player_rw:get_uid(), Msg]),
    {_Bytes1, IoList} = tcp_codec:encode(Msg),
    tcp_handler:direct_send_net_msg(socket(), IoList),
    ok.

%%-------------------------------------------------------------------
on_init(Socket) ->
    {Ip, Port} = misc:peername(Socket),
    socket(Socket),
    lib_player_priv:init(),
    set_latest_net_time(),
    check_idle_msg(),
    ?DEBUG("client connected: ~p ~ts:~p", [Socket, Ip, Port]),
    {ok, #r_player_state{}}.

%%-------------------------------------------------------------------
on_data(Socket, Data, S)->
    set_latest_net_time(),
    tcp_codec:decode(fun mod_player:on_net_msg/2, Socket, Data),
    S.

%%-------------------------------------------------------------------
on_close(Socket, Reason, S) ->
    lib_player_priv:offline(Reason),
    ?INFO("~p socket ~p close,reason:~p",[self(), Socket, Reason]),
    S.

%%-------------------------------------------------------------------
on_info_msg(check_net, S) ->
    check_idle_action(),
    S;
on_info_msg({kick, Reason}, S) ->
    mod_player:stop(Reason),
    S;
on_info_msg({net_msg, NetMsg}, S) ->
    mod_player:send(NetMsg),
    S;
on_info_msg({login_ack, Msg}, S) ->
    ?DEBUG("login_ack:~p",[Msg]),
    lib_player_priv:login_ack(Msg),
    S;
on_info_msg({load_player_list_ack, List}, S) ->
    ?DEBUG("load_player_list_ack:~p",[List]),
    lib_player_priv:loaded_player_list(List),
    S;
on_info_msg({load_player_data_ack, Player}, S) ->
    ?DEBUG("load_player_data_ack"),
    lib_player_priv:loaded_player(Player),
    S;
on_info_msg({create_player_ack, Ack}, S) ->
    ?DEBUG("create_player_ack"),
    lib_player_priv:create_player_ack(Ack),
    S;
on_info_msg(return_to_pre_map_ack, S) ->
    lib_player_priv:goto_to_pre_map(),
    S;
on_info_msg(passive_change_req, S) ->
    lib_player_priv:goto_to_pre_map(),
    S;
on_info_msg({teleport, NewPos}, S) ->
    lib_player_priv:teleport_call(NewPos),
    S;
on_info_msg(Info, S) ->
    lib_player:on_info_msg(Info),
    S.

%%-------------------------------------------------------------------
on_call_msg(Request, From, S)->
    ?DEBUG("call ~p from ~p",[Request, From]),
    Ret = lib_player:on_call_msg(Request, From),
    {Ret, S}.

%%-------------------------------------------------------------------
on_cast_msg(Request, S) ->
    lib_player:on_cast_msg(Request),
    S.

%%-------------------------------------------------------------------
on_net_msg(Cmd, Msg)->
    ?DEBUG("net msg ~p:~p",[Cmd, Msg]),
    ?TRY_CATCH( route_msg(Cmd, Msg) ),
    ok.

route_msg(Cmd, Msg) ->
    %%1. hook
    ?DEBUG("route(~p)",[Msg]),
    Status = lib_player_rw:get_status(),
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
    lib_player_netmsg:handle(Msg).


dispatcher_msg_s(NeedStatus, Cmd, Msg) ->
    case lib_player_rw:get_status() of
        NeedStatus -> lib_player_netmsg:handle(Msg);
        _ -> log_error_msg(status_error, Cmd, Msg)
    end.

log_error_msg(Reason, Cmd, Msg) ->
    ?ERROR("~p ~p status ~p, Cmd ~p, msg ~w",
        [lib_player_rw:get_uid(), Reason, lib_player_rw:get_status(), Cmd, Msg]).

%%-------------------------------------------------------------------
socket(Socket) -> put(?SocketKey, Socket).
socket()-> get(?SocketKey).

%%%-------------------------------------------------------------------
set_latest_net_time() -> put('RECV_NETMSG_LATEST', time:milli_seconds()).
check_idle_msg() -> erlang:send_after(?NET_IDLE_TIME, self(), check_net).
check_idle_action() ->
    try
        case time:milli_seconds() - get('RECV_NETMSG_LATEST') > ?NET_IDLE_TIME of
            true -> mod_player:stop(net_heartbeat_stop);
            false -> check_idle_msg()
        end
    catch _ : _ : _ ->
        mod_player:stop(net_heartbeat_stop)
    end.