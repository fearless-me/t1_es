%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. 六月 2018 10:21
%%%-------------------------------------------------------------------
-module(broadcast_srv).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("netconf.hrl").
-include("gs_cache.hrl").

-include("gs_ps_def.hrl").

%% API
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?GS_BROADCAST_OTP}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    tcp_codec:init(#net_conf{}),

    {ok, ok}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({broadcast_net, NetMsg}, State) ->
    broadcast_net_msg(NetMsg),
    {noreply, State};
do_handle_info({broadcast, {MsgId, Msg}}, State) ->
    broadcast_msg(MsgId, Msg),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.


%%--------------------------------------------------------------------
broadcast_net_msg(NetMsg) ->
    do_broadcast_net_msg(gs_conf:is_cross(), NetMsg),
    ok.

do_broadcast_net_msg(true, NetMsg) ->
    ets:foldl(
        fun(#m_cache_player_pid_sock{pid = Pid}, _) ->
            catch gs_interface:send_net_msg(Pid, NetMsg)
        end, 0, ?ETS_CACHE_PLAYER_PID_SOCK),
    ok;
do_broadcast_net_msg(_Any, NetMsg) ->
    {_Bytes1, IoList} = tcp_codec:encode(NetMsg),
    ets:foldl(
        fun(#m_cache_player_pid_sock{sock = Sock}, _) ->
            catch tcp_handler:direct_send_net_msg(Sock, IoList)
        end, 0, ?ETS_CACHE_PLAYER_PID_SOCK),
    ok.

broadcast_msg(MsgId, Msg) ->
    ets:foldl(
        fun(#m_cache_player_pid_sock{pid = Pid}, _) ->
            ps:send(Pid, MsgId, Msg)
        end, 0, ?ETS_CACHE_PLAYER_PID_SOCK),
    ok.



