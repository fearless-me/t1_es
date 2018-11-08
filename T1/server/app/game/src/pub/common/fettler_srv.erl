%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 十一月 2018 15:56
%%%-------------------------------------------------------------------
-module(fettler_srv).
-author("Administrator").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("gs_cache.hrl").


%% API
-export([server_crash/2]).
-export([start_link/0]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


server_crash(Sid, Node) ->
    erlang:spawn(
        fun() ->
            QS =
                ets:fun2ms
                (
                    fun(Info) when Info#m_cache_online_player.sid == Sid ->
                        {
                            Info#m_cache_online_player.aid,
                            Info#m_cache_online_player.uid,
                            Info#m_cache_online_player.map_pid
                        }
                    end
                ),
            List = misc_ets:select(?ETS_CACHE_ONLINE_PLAYER, QS),
            lists:foreach(
                fun({Aid, Uid, MPid}) ->
                    catch map_interface:player_exit_map_exception_(MPid, Uid),
                    catch gs_cache_interface:offline(Aid, Uid)
                end, List)
        end),
    ok.


%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),

    {ok, ok}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.