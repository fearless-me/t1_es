%-------------------------------------------------------------------
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
%% @todo 不要集中这样做
%% tcp_handler:direct_send_net_msg(Sock, IoList)
%% http://blog.yufeng.info/archives/1581
%% http://blog.yufeng.info/archives/336
broadcast_net_msg(NetMsg) ->
    Ms = ets:fun2ms(fun(#m_cache_online_player{socket = Sock}) -> Sock end),
    Fc =
        fun() ->
            {_Bytes1, IoList} = tcp_codec:encode(NetMsg),
            L = misc_ets:select(?ETS_CACHE_ONLINE_PLAYER, Ms),
            lists:foreach
            (
                fun(Sock) ->
                    erlang:spawn
                    (
                        fun() ->
                            catch tcp_handler:direct_send_net_msg(Sock, IoList)
                        end
                    )
                end,
                L
            )
        end,
    erlang:spawn(Fc),
    ok.

broadcast_msg(MsgId, Msg) ->
    Ms = ets:fun2ms(fun(#m_cache_online_player{pid = Pid}) -> Pid end),
    Fc =
        fun() ->
            L = misc_ets:select(?ETS_CACHE_ONLINE_PLAYER, Ms),
            lists:foreach
            (
                fun(Pid) ->
                    erlang:spawn
                    (
                        fun() ->
                            catch ps:send(Pid, MsgId, Msg)
                        end
                    )
                end,
                L
            )
        end,
    
    erlang:spawn(Fc),
    ok.



