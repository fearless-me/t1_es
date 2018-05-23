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
-include("player_record.hrl").
-include("pub_common.hrl").

-define(SocketKey,socketRef___).

-record(r_player_state,{}).


%% API
-export([stop/1, direct_stop/0, send/1,direct_send/1]).
-export([on_init/1, on_data/3, on_close/3]).
-export([on_info_msg/2, on_call_msg/3, on_cast_msg/2, on_net_msg/2]).
-export([socket/1, socket/0]).
%%%-------------------------------------------------------------------
stop(Reason)->
    tcp_handler:active_stop(Reason).

direct_stop()->
    erlang:exit(self(), normal).
%%%-------------------------------------------------------------------
send(IoList) when is_list(IoList)->
    tcp_handler:send_net_msg(IoList);
send(Msg) ->
    {_Bytes1, IoList} = tcp_codec:encode(Msg),
    tcp_handler:send_net_msg(IoList),
    ok.

direct_send(IoList)->
    tcp_handler:direct_send_net_msg(socket(), IoList).

%%%-------------------------------------------------------------------
on_init(Socket) ->
    {Ip, Port} = misc:peername(Socket),
    socket(Socket),
    lib_player:init(),
    ?DEBUG("client connected: ~p ~ts:~p", [Socket, Ip, Port]),
    {ok, #r_player_state{}}.

on_data(Socket, Data, S)->
%%    ?DEBUG("~p,recieve:~p",[Socket, Data]),
%%    direct_send([Data]),
    tcp_codec:decode(fun mod_player:on_net_msg/2, Socket, Data),
    S.

on_close(Socket, Reason, S) ->
    lib_player:offline(),
    ?INFO("~p close,reason:~p",[Socket, Reason]),
    S.
%%%-------------------------------------------------------------------
on_info_msg({login_ack, Msg}, S) ->
    ?DEBUG("login_ack:~p",[Msg]),
    lib_player:login_ack(Msg),
    S;
on_info_msg({load_player_list_ack, List}, S) ->
    ?DEBUG("load_player_list_ack:~p",[List]),
    lib_player:load_all_role_info(List),
    S;
on_info_msg({load_player_data_ack, DataBin}, S) ->
    ?DEBUG("load_player_data_ack"),
    lib_player:loaded_player(DataBin),
    S;
on_info_msg({create_player_ack, Ack}, S) ->
    ?DEBUG("load_player_data_ack"),
    lib_player:create_player_ack(Ack),
    S;
on_info_msg(return_to_pre_map, S) ->
    lib_player:return_to_pre_map(),
    S;
on_info_msg(Info, S) ->
    ?DEBUG("info:~p",[Info]),
    S.

on_call_msg(Request, From, S)->
    ?DEBUG("call ~p from ~p",[Request, From]),
    {true, S}.

on_cast_msg(Request, S) ->
    ?DEBUG("cast:~p",[Request]),
    S.


on_net_msg(Cmd, Msg)->
    ?DEBUG("net msg ~p:~p",[Cmd, Msg]),
    ?TRY_CATCH( lib_route:route(Msg) ),
    ok.

%%%-------------------------------------------------------------------
socket(Socket) -> put(?SocketKey, Socket).
socket()-> get(?SocketKey).